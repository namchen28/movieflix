import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieflix/utils/widget/password_text_field.dart';
import 'package:movieflix/utils/widget/text_field.dart';

import '../bloc/auth_bloc.dart';
import 'signin_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
                      builder: (context) => const SignInScreen(),
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
                        CustomTextField(
                            emailController: _emailController,
                            placeHolder: "Email"),
                        const SizedBox(height: 8),
                        const Text('username').tr(),
                        const SizedBox(height: 8),
                        CustomTextField(
                            emailController: _nameController,
                            placeHolder: "username".tr()),
                        const SizedBox(height: 8),
                        const Text('password').tr(),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 45,
                          child: PasswordTextField(
                            obscureText: obscurePassword,
                            passwordController: _passwordController,
                            placeHolder: 'password'.tr(),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text('confirmPassword').tr(),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 45,
                          child: PasswordTextField(
                              obscureText: obscureConfirmPassword,
                              passwordController: _confirmPasswordController,
                              placeHolder: 'confirmPassword'.tr()),
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
                        child: Text('signUp',
                                style: Theme.of(context).textTheme.titleSmall)
                            .tr()),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('alrHaveAcc').tr(),
                        const SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<AuthBloc>(context).add(
                              SignInNavigateEvent(),
                            );
                          },
                          child: const Text(
                            'signIn',
                            style: TextStyle(
                                color: CupertinoColors.destructiveRed),
                          ).tr(),
                        ),
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
