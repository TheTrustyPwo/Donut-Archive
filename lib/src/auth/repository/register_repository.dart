import 'package:donut/src/auth/services/register_service.dart';
import 'package:donut/src/user/models/models.dart';

class RegisterRepository {
  final RegisterService registerService = RegisterService();

  Future<User> register(
          {required String username,
          required String email,
          required String password}) =>
      registerService.register(username, email, password);
}
