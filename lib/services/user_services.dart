import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourist_app/models/user_model.dart';

class UserService {
  Future<List<UserModel>> loadCachedUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedData = prefs.getString('usersData');
    if (cachedData != null) {
      final List<dynamic> jsonData = jsonDecode(cachedData);
      return jsonData.map((user) => UserModel.fromJson(user)).toList();
    }
    return [];
  }

  Future<void> cacheUsers(List<UserModel> users) async {
    final prefs = await SharedPreferences.getInstance();
    final cachedData = jsonEncode(users.map((user) => user.toJson()).toList());
    await prefs.setString('usersData', cachedData);
  }

  Future<void> addUser(UserModel newUser) async {
    final cachedUsers = await loadCachedUsers();
    final newId = (cachedUsers.isNotEmpty ? cachedUsers.last.id + 1 : 1);
    final updatedUser = newUser.copyWith(id: newId);
    cachedUsers.add(updatedUser);
    await cacheUsers(cachedUsers);
  }

  Future<void> updateUser(UserModel updatedUser) async {
    final cachedUsers = await loadCachedUsers();
    final index = cachedUsers.indexWhere((user) => user.id == updatedUser.id);
    if (index != -1) {
      cachedUsers[index] = updatedUser;
      await cacheUsers(cachedUsers);
    }
  }

  Future<void> deleteUser(int userId) async {
    final cachedUsers = await loadCachedUsers();
    cachedUsers.removeWhere((user) => user.id == userId);
    await cacheUsers(cachedUsers);
  }
}
