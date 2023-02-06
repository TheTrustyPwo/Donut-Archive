import 'dart:convert';

import 'package:donut/src/config/app_config.dart';
import 'package:donut/src/user/user.dart';
import 'package:http/http.dart' as http;

class RegisterService {
  Future<User> register(String username, String email, String password) async {
    final body = {"username": username, "email": email, "password": password};
    final registerUri = Uri.parse('${AppConfig.apiUrl}/users/');
    final response = await http.post(registerUri, body: body);
    if (response.statusCode == 200) {
      final parse = json.decode(response.body);
      final user = User.fromJson(parse);
      return user;
    } else {
      throw Exception("An Error Occurred");
    }
  }
}
