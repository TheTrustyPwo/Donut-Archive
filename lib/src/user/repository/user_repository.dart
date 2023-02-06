import 'dart:async';

import 'package:donut/src/user/models/models.dart';
import 'package:donut/src/user/services/user_service.dart';

class UserRepository {
  User? _user;

  Future<User?> getUser(int uid) async {
    if (_user != null) return _user;
    return UserService().get(uid);
  }
}
