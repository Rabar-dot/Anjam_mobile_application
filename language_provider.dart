// File: lib/auth_provider.dart
import 'package:flutter/foundation.dart';

enum UserType { patient, doctor, reception }

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  UserType? _userType;
  String? _userId;
  String? _userName;

  bool get isAuthenticated => _isAuthenticated;
  UserType? get userType => _userType;
  String? get userId => _userId;
  String? get userName => _userName;

  Future<bool> login({required String email, required String password}) async {
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      
      // Mock authentication logic based on email
      if (email.contains('doctor')) {
        _userType = UserType.doctor;
      } else if (email.contains('reception')) {
        _userType = UserType.reception;
      } else {
        _userType = UserType.patient;
      }
      
      _isAuthenticated = true;
      _userId = '12345';
      _userName = email.split('@')[0];
      
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> signUp({
    required String email,
    required String password,
    required String factoryCode,
    required String nationalId,
    required String nationalIdImagePath,
    required bool enableFaceId,
  }) async {
    try {
      // Simulate API call for registration
      await Future.delayed(const Duration(seconds: 3));
      
      // Determine user type based on factory code
      if (factoryCode == 'ANJAM001') {
        _userType = UserType.doctor;
      } else if (factoryCode == 'ANJAM002') {
        _userType = UserType.reception;
      } else {
        _userType = UserType.patient;
      }
      
      _isAuthenticated = true;
      _userId = DateTime.now().millisecondsSinceEpoch.toString();
      _userName = email.split('@')[0];
      
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  void logout() {
    _isAuthenticated = false;
    _userType = null;
    _userId = null;
    _userName = null;
    notifyListeners();
  }
}