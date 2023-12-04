import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movieflix/auth/presentation/signin_screen.dart';
import 'package:movieflix/widget/home.dart';

class AuthMain extends StatelessWidget {
  const AuthMain({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.red),
            );
          }
          if (snapshot.hasData) {
            return HomeScreen();
          }
          return const SignInScreen();
        });
  }
}
