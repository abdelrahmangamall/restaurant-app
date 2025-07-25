import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_mobile_app/models/menu_item.dart';
import 'package:restaurant_mobile_app/providers/auth_provider.dart';
import 'package:restaurant_mobile_app/providers/cart_provider.dart';
import 'package:restaurant_mobile_app/screens/cart_screen.dart';
import 'package:restaurant_mobile_app/services/database_service.dart';
import 'package:restaurant_mobile_app/widgets/menu_item_card.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    final databaseService = Provider.of<DatabaseService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authProvider.logout();
              Navigator.pushReplacementNamed(context, '/auth');
            },
          ),
        ],
      ),
      body: StreamBuilder<List<MenuItem>>(
        stream: databaseService.menuItems,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final menuItems = snapshot.data ?? [];

          if (menuItems.isEmpty) {
            return const Center(child: Text('No menu items available'));
          }

          return ListView.builder(
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              final item = menuItems[index];
              return MenuItemCard(
                item: item,
                onAddToCart: () => cartProvider.addToCart(item),
              );
            },
          );
        },
      ),
    );
  }
}