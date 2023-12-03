import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieflix/auth/auth_bloc.dart';
import 'package:movieflix/auth_repository.dart';
import 'package:movieflix/screen/forgot_password.dart';
import 'package:movieflix/screen/signup_screen.dart';
import 'package:movieflix/widget/home.dart';
import 'package:movieflix/widget/password_text_field.dart';
import 'package:movieflix/widget/text_field.dart';

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
                        CustomTextField(
                          emailController: _emailController,
                          placeHolder: "Email",
                        ),
                        const SizedBox(height: 8),
                        const Text('password').tr(),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 45,
                          child: PasswordTextField(
                              placeHolder: 'password'.tr(),
                              obscureText: obscureText,
                              passwordController: _passwordController),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // CupertinoCheckbox(
                            //   value: false,
                            //   onChanged: (value) {
                            //     return;
                            //   },
                            // ),
                            // const Text('Remember me'),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<AuthBloc>(context)
                                .add(ForgotPasswordNavigateEvent());
                          },
                          child: const Text('forgotPw',
                                  style: TextStyle(
                                      color: CupertinoColors.destructiveRed))
                              .tr(),
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
                      child: Text('signIn',
                              style: Theme.of(context).textTheme.titleSmall)
                          .tr(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('dontHaveAcc').tr(),
                        const SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<AuthBloc>(context)
                                .add(SignUpNavigateEvent());
                          },
                          child: const Text(
                            'signUp',
                            style: TextStyle(
                                color: CupertinoColors.destructiveRed),
                          ).tr(),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                      indent: 8,
                      endIndent: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: CupertinoColors.inactiveGray),
                      height: 60,
                      width: double.infinity,
                      child: CupertinoButton(
                        onPressed: () {
                          AuthRepository().signInWithGoogle();
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/google.png',
                                height: 48,
                                width: 48,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text('google',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium)
                                  .tr()
                            ]),
                      ),
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
