import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/tv.png'),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Email'),
                    const SizedBox(height: 8),
                    const CupertinoTextField(
                        placeholder: 'Email', padding: EdgeInsets.all(10)),
                    const SizedBox(height: 8),
                    const Text('Username'),
                    const SizedBox(height: 8),
                    const CupertinoTextField(
                        placeholder: 'Username', padding: EdgeInsets.all(10)),
                    const SizedBox(height: 8),
                    const Text('Password'),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 40,
                      child: CupertinoTextField(
                        placeholder: 'Password',
                        padding: const EdgeInsets.all(10),
                        suffix: IconButton(
                          onPressed: () {},
                          icon: const Icon(CupertinoIcons.eye_slash_fill),
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('Re - enter password'),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 40,
                      child: CupertinoTextField(
                        placeholder: 'Re - enter password',
                        padding: const EdgeInsets.all(10),
                        suffix: IconButton(
                          onPressed: () {},
                          icon: const Icon(CupertinoIcons.eye_slash_fill),
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                CupertinoButton.filled(
                    onPressed: () {}, child: const Text('Sign Up')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Sign In',
                          style:
                              TextStyle(color: CupertinoColors.destructiveRed),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/google.png',
                          height: 48,
                          width: 48,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton.filled(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/facebook.png',
                          height: 48,
                          width: 48,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
