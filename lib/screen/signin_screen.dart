import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 40, 40),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/tv.png'),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CupertinoCheckbox(
                          value: false,
                          onChanged: (value) {
                            return;
                          },
                        ),
                        const Text('Remember me'),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Forgot password',
                          style:
                              TextStyle(color: CupertinoColors.destructiveRed)),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                CupertinoButton.filled(
                    onPressed: () {}, child: const Text('Sign In')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Sign Up',
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
