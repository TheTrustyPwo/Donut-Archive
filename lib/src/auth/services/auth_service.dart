import 'dart:convert';

import 'package:donut/src/config/app_config.dart';
import 'package:http/http.dart' as http;
import 'package:donut/src/auth/models/models.dart';
import 'package:donut/src/user/user.dart';

class AuthService {
  Future<User> verifyToken(Token token) async {
    // TODO: HTTP Request when backend is complete
    if (token.token == "token") {
      const user = User(1, "ThePwo", 80142550, "thetrustypwo@gmail.com", "Pass123!", 0, 0, "Donuts are sweet", "");
      return user;
    }
    throw Exception("Invalid Token");
  }

  Future<Token> login(String email, String password) async {
    // TODO: HTTP Request when backend is complete
    if (email == "thetrustypwo@gmail.com" && password == "Pass123!") {
      return Token("token");
    }
    /* final body = {"email": email, "password": password};
    final loginUri = Uri.parse('${AppConfig.apiUrl}/login/');
    final response = await http.post(loginUri, body: body);
    if (response.statusCode == 200) {
      final String token = response.headers['X-ACCESS-TOKENS']!;
      return token;
    } */
    throw Exception("Invalid Credentials");
  }

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
