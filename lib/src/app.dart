import 'package:donut/src/auth/auth.dart';
import 'package:donut/src/auth/view/welcome/welcome_page.dart';
import 'package:donut/src/home/home.dart';
import 'package:donut/src/onboarding/view/onboarding_page.dart';
import 'package:donut/src/splash/splash.dart';
import 'package:donut/src/user/user.dart';
import 'package:donut/src/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.authenticationRepository,
    required this.userRepository,
  }) : super(key: key);

  final AuthRepository authenticationRepository;
  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: authenticationRepository,
          userRepository: userRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) async {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  HomePage.route(),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.unauthenticated:
                SharedPreferences prefs = await SharedPreferences.getInstance();
                if (prefs.getBool('seen') ?? false) {
                  _navigator.pushAndRemoveUntil<void>(
                    WelcomePage.route(),
                        (route) => false,
                  );
                } else {
                  await prefs.setBool('seen', true);
                  _navigator.pushAndRemoveUntil<void>(
                    OnboardingPage.route(MediaQuery.of(context).size.height),
                    (route) => false,
                  );
                }
                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
