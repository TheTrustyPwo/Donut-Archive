import 'dart:convert';

import 'package:donut/src/config/app_config.dart';
import 'package:donut/src/user/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<User> get(int uid) async {
    final endpoint = Uri.parse('${AppConfig.apiUrl}/users/$uid');
    final response = await http.get(endpoint);
    if (response.statusCode == 200) {
      final parse = json.decode(response.body);
      final user = User.fromJson(parse);
      return user;
    } else {
      throw Exception("An Error Occurred");
    }
  }
}
