import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourist_app/models/user_model.dart';

class DataHandling {
  List<UserModel> users = [];
  final Dio dio;
  final String baseUrl = 'https://jsonplaceholder.typicode.com/users/';

  DataHandling(this.dio);

  Future<void> addUser(UserModel newUser) async {
    try {
      if (users.any((user) => user.email == newUser.email)) {
        throw Exception('User with this email already exists.');
      }

      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final int newId = (users.isNotEmpty ? users.last.id + 1 : 1);
      newUser = newUser.copyWith(id: newId);

      users.add(newUser);
      final String updatedData =
          jsonEncode(users.map((e) => e.toJson()).toList());
      await prefs.setString('usersData', updatedData);
    } catch (e) {
      throw Exception('Error adding user: $e');
    }
  }

  Future<void> updateUser(UserModel updatedUser) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final int index = users.indexWhere((user) => user.id == updatedUser.id);

      if (index != -1) {
        users[index] = updatedUser;
        final String updatedData =
            jsonEncode(users.map((e) => e.toJson()).toList());
        await prefs.setString('usersData', updatedData);
      }
    } catch (e) {
      throw Exception('Error updating user: $e');
    }
  }

  Future<void> deleteUser(int id) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      users.removeWhere((user) => user.id == id);
      final String updatedData =
          jsonEncode(users.map((user) => user.toJson()).toList());
      await prefs.setString('usersData', updatedData);
    } catch (e) {
      throw Exception('Error deleting user: $e');
    }
  }

  Future<List<UserModel>> loadCachedUsers() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? cachedData = prefs.getString('usersData');
      if (cachedData != null) {
        final List<dynamic> jsonData = jsonDecode(cachedData);
        users = jsonData.map((user) => UserModel.fromJson(user)).toList();
      } else {
        final Response response = await dio.get(baseUrl);
        if (response.statusCode == 200) {
          final List<dynamic> remoteData = response.data;
          users = remoteData.map((user) => UserModel.fromJson(user)).toList();
          final String updatedData =
              jsonEncode(users.map((e) => e.toJson()).toList());
          await prefs.setString('usersData', updatedData);
        }
      }
      return users;
    } catch (e) {
      throw Exception('Error loading users: $e');
    }
  }
}
