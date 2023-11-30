import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieflix/auth/auth_bloc.dart';
import 'package:movieflix/auth_repository.dart';
import 'package:movieflix/screen/forgot_password.dart';
import 'package:movieflix/screen/signup_screen.dart';
import 'package:movieflix/widget/home.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void signIn() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all the fields'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      context.read<AuthBloc>().add(SignInRequest(
            email: _emailController.text,
            password: _passwordController.text,
          ));
    }
  }

  bool obscureText = true;
  void _toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is SignInSuccessState) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                  _emailController.clear();
                  _passwordController.clear();
                }
                if (state is SignInFailedState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
                if (state is SignUpNavigateState) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()));
                }
                if (state is ForgotPasswordNavigateState) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPassWordScreen()));
                }
              },
              listenWhen: (previous, current) => current is AuthActionState,
              buildWhen: (previous, current) => current is! AuthActionState,
              builder: (context, state) {
                return Column(
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
                        CupertinoTextField(
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                                borderRadius: BorderRadius.circular(14)),
                            placeholderStyle:
                                const TextStyle(color: Colors.grey),
                            controller: _emailController,
                            placeholder: 'Email',
                            padding: const EdgeInsets.all(10),
                            style: Theme.of(context).textTheme.titleSmall),
                        const SizedBox(height: 8),
                        const Text('Password'),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 45,
                          child: CupertinoTextField(
                              obscureText: obscureText,
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  borderRadius: BorderRadius.circular(14)),
                              placeholderStyle:
                                  const TextStyle(color: Colors.grey),
                              controller: _passwordController,
                              placeholder: 'Password',
                              padding: const EdgeInsets.all(10),
                              suffix: IconButton(
                                padding: const EdgeInsets.all(8),
                                iconSize: 24,
                                onPressed: () {
                                  _toggle();
                                },
                                icon: Icon(
                                  obscureText
                                      ? CupertinoIcons.eye_slash_fill
                                      : CupertinoIcons.eye_fill,
                                ),
                                color: CupertinoColors.systemGrey,
                              ),
                              style: Theme.of(context).textTheme.titleSmall),
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
                          onPressed: () {
                            BlocProvider.of<AuthBloc>(context)
                                .add(ForgotPasswordNavigateEvent());
                          },
                          child: const Text('Forgot password',
                              style: TextStyle(
                                  color: CupertinoColors.destructiveRed)),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    CupertinoButton(
                      color: CupertinoColors.destructiveRed,
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context).add(
                          SignInRequest(
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        );
                      },
                      child: Text('Sign In',
                          style: Theme.of(context).textTheme.titleSmall),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account?'),
                        TextButton(
                            onPressed: () {
                              BlocProvider.of<AuthBloc>(context)
                                  .add(SignUpNavigateEvent());
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: CupertinoColors.destructiveRed),
                            )),
                      ],
                    ),
                    CupertinoButton.filled(
                      onPressed: () {
                        AuthRepository().signInWithGoogle();
                      },
                      child: Row(children: [
                        Image.asset(
                          'assets/google.png',
                          height: 48,
                          width: 48,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text('Sign In with Google')
                      ]),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
