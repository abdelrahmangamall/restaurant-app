import 'package:flutter/material.dart';
import 'package:restaurant_mobile_app/models/user_model.dart';
import 'package:restaurant_mobile_app/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  UserModel? _user;

  UserModel? get user => _user;

  Future<void> login(String email, String password) async {
    try {
      _user = await _authService.loginWithEmailAndPassword(email, password);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      _user = await _authService.signUpWithEmailAndPassword(email, password);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    _user = null;
    notifyListeners();
  }

  Future<void> checkAuthStatus() async {
    _user = await _authService.getCurrentUser();
    notifyListeners();
  }
}