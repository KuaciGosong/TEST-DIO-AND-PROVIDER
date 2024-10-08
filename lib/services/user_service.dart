import 'package:dio/dio.dart';
import '../models/user_model.dart';

class UserService {
  final Dio _dio;

  UserService({Dio? dio}) : _dio = dio ?? Dio();

  Future<List<UserModel>> getUsers() async {
    try {
      final response = await _dio.get('https://dummyapi.online/api/users');
      List<UserModel> users = (response.data as List)
          .map((userData) => UserModel.fromJson(userData))
          .toList();
      return users;
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }
}
