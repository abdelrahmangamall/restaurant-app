import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_mobile_app/models/menu_item.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch all menu items from Firestore
  Stream<List<MenuItem>> get menuItems {
    return _firestore.collection('menuItems').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return MenuItem.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }

  // Add a new menu item (for admin functionality)
  Future<void> addMenuItem(MenuItem item) async {
    await _firestore.collection('menuItems').add(item.toMap());
  }

  // Update a menu item
  Future<void> updateMenuItem(String id, MenuItem item) async {
    await _firestore.collection('menuItems').doc(id).update(item.toMap());
  }

  // Delete a menu item
  Future<void> deleteMenuItem(String id) async {
    await _firestore.collection('menuItems').doc(id).delete();
  }
}