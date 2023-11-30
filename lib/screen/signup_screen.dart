import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieflix/auth/auth_bloc.dart';
import 'package:movieflix/screen/signin_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  void _togglePasswordVisibility() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      obscureConfirmPassword = !obscureConfirmPassword;
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
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 40),
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is SignUpSuccessState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()));
                  _nameController.clear();
                  _emailController.clear();
                  _passwordController.clear();
                  _confirmPasswordController.clear();
                }
                if (state is SignUpFailedState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
                if (state is SignInNavigateState) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInScreen(),
                    ),
                  );
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
                    const SizedBox(height: 15),
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
                            padding: EdgeInsets.all(10),
                            style: Theme.of(context).textTheme.titleSmall),
                        const SizedBox(height: 8),
                        const Text('Username'),
                        const SizedBox(height: 8),
                        CupertinoTextField(
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                                borderRadius: BorderRadius.circular(14)),
                            placeholderStyle:
                                const TextStyle(color: Colors.grey),
                            controller: _nameController,
                            placeholder: 'Username',
                            padding: EdgeInsets.all(10),
                            style: Theme.of(context).textTheme.titleSmall),
                        const SizedBox(height: 8),
                        const Text('Password'),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 45,
                          child: CupertinoTextField(
                              obscureText: obscurePassword,
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
                                  _togglePasswordVisibility();
                                },
                                icon: Icon(
                                  obscurePassword
                                      ? CupertinoIcons.eye_slash_fill
                                      : CupertinoIcons.eye_fill,
                                ),
                                color: CupertinoColors.systemGrey,
                              ),
                              style: Theme.of(context).textTheme.titleSmall),
                        ),
                        const SizedBox(height: 8),
                        const Text('Confirm password'),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 45,
                          child: CupertinoTextField(
                              obscureText: obscureConfirmPassword,
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  borderRadius: BorderRadius.circular(14)),
                              placeholderStyle:
                                  const TextStyle(color: Colors.grey),
                              controller: _confirmPasswordController,
                              placeholder: 'Confirm password',
                              padding: const EdgeInsets.all(10),
                              suffix: IconButton(
                                padding: const EdgeInsets.all(8),
                                iconSize: 24,
                                onPressed: () {
                                  _toggleConfirmPasswordVisibility();
                                },
                                icon: Icon(
                                  obscureConfirmPassword
                                      ? CupertinoIcons.eye_slash_fill
                                      : CupertinoIcons.eye_fill,
                                ),
                                color: CupertinoColors.systemGrey,
                              ),
                              style: Theme.of(context).textTheme.titleSmall),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    CupertinoButton(
                        color: CupertinoColors.destructiveRed,
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context).add(
                            SignUpRequest(
                              username: _nameController.text.trim(),
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                              confirmPassword:
                                  _confirmPasswordController.text.trim(),
                            ),
                          );
                        },
                        child: Text('Sign Up',
                            style: Theme.of(context).textTheme.titleSmall)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        TextButton(
                            onPressed: () {
                              BlocProvider.of<AuthBloc>(context).add(
                                SignInNavigateEvent(),
                              );
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                  color: CupertinoColors.destructiveRed),
                            )),
                      ],
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
