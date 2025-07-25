import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_mobile_app/providers/auth_provider.dart';
import 'package:restaurant_mobile_app/providers/cart_provider.dart';
import 'package:restaurant_mobile_app/screens/auth_screen.dart';
import 'package:restaurant_mobile_app/screens/menu_screen.dart';
import 'package:restaurant_mobile_app/screens/splash_screen.dart';
import 'package:restaurant_mobile_app/services/database_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        Provider(create: (_) => DatabaseService()),
      ],
      child: MaterialApp(
        title: 'Restaurant App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const SplashScreen(),
        routes: {
          '/auth': (context) => const AuthScreen(),
          '/menu': (context) => const MenuScreen(),
        },
      ),
    );
  }
}