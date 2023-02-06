import 'dart:async';
import 'package:donut/src/auth/services/auth_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:donut/src/auth/models/models.dart';
import 'package:donut/src/user/user.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthRepository {
  final _controller = StreamController<AuthenticationStatus>();
  final storage = const FlutterSecureStorage();
  final AuthService authService = AuthService();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<User> login({required String email, required String password}) async {
    final token = await authService.login(email, password);
    final user = verifyToken(token);
    _controller.add(AuthenticationStatus.authenticated);
    return user;
  }

  Future<Token> getToken() async {
    String? token = await storage.read(key: "authToken");
    if (token != null) {
      return Token(token);
    }
    throw Exception("Token Not Found");
  }

  Future<void> persistToken(Token token) async {
    storage.write(key: "authToken", value: token.token);
  }

  Future<bool> hasToken() async {
    String? token = await storage.read(key: "authToken");
    return token != null;
  }

  Future<void> deleteToken() async {
    await storage.delete(key: "authToken");
  }

  Future<User> verifyToken(Token token) async {
    final user = authService.verifyToken(token);
    return user;
  }

  void logout() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
