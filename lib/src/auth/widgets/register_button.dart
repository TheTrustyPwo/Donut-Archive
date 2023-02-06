import 'package:flutter/material.dart';
import 'package:donut/src/auth/auth.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFF1B166), Color(0xFFE58943)]),
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
          "Register",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
    );
  }
}
