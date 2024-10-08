import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/user_service.dart';

class UserProvider extends ChangeNotifier {
  final UserService service;
  List<UserModel> _userList = [];
  bool _isLoading = false;

  UserProvider({required this.service});

  List<UserModel> get userList => _userList;
  bool get isLoading => _isLoading;

  Future<void> getUserList() async {
    _isLoading = true;
    notifyListeners();

    try {
      _userList = await service.getUsers();
    } catch (e) {
      debugPrint('Error loading users: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
