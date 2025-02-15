import 'package:tourist_app/services/users_firebase_services.dart';

class UserServiceSingleton {
  static final UserServiceSingleton _instance =
      UserServiceSingleton._internal();
  final UsersFirebaseServices _userService = UsersFirebaseServices();

  factory UserServiceSingleton() => _instance;

  UserServiceSingleton._internal();

  UsersFirebaseServices get service => _userService;
}
