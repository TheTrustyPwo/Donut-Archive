import 'package:flutter/material.dart';
import 'package:donut/src/auth/auth.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.pink.shade200, Colors.pink.shade400]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: MaterialButton(
        minWidth: double.infinity,
        height: 60,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: const Text(
          "Login",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
    );
  }
}
