import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourist_app/models/user_model.dart';

class DataHandling {
  List<UserModel> users = [];
  final Dio dio;

  DataHandling(this.dio);

  final String baseUrl = 'https://jsonplaceholder.typicode.com/users/';

  Future<void> addUser(UserModel newUser) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Generate a unique ID for the new user
    final int newId = (users.isNotEmpty ? users.last.id + 1 : 1);
    newUser = UserModel(
      id: newId,
      name: newUser.name,
      email: newUser.email,
      phone: newUser.phone,
    );

    // Add the new user and update cache
    users.add(newUser);
    final String updatedData =
        jsonEncode(users.map((e) => e.toJson()).toList());
    await prefs.setString('usersData', updatedData);
  }

  Future<void> updateUser(UserModel updatedUser) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Find the updated user
    final int index = users.indexWhere((user) => user.id == updatedUser.id);
    if (index != -1) {
      users[index] = updatedUser;

      // Update the user and update cache
      final String updatedData =
          jsonEncode(users.map((e) => e.toJson()).toList());
      prefs.setString('usersData', updatedData);
    }
  }

  Future<void> deleteUser(int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    users.removeWhere((user) => user.id == id);
    final String updatedData =
        jsonEncode(users.map((user) => user.toJson()).toList());
    prefs.setString('usersData', updatedData);
  }

  Future<List<UserModel>> loadCachedUsers() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? cachedData = prefs.getString('usersData');
    if (cachedData != null) {
      final List<dynamic> jsonData = jsonDecode(cachedData);
      return jsonData.map((user) => UserModel.fromJson(user)).toList();
    }
    return [];
  }
}
