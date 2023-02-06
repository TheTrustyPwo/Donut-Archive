import 'src/auth/auth.dart';
import 'package:flutter/widgets.dart';
import 'src/app.dart';
import 'src/user/user.dart';

void main() {
  runApp(App(
    authenticationRepository: AuthRepository(),
    userRepository: UserRepository(),
  ));
}