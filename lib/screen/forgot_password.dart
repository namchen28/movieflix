import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieflix/auth/auth_bloc.dart';
import 'package:movieflix/screen/signin_screen.dart';

class ForgotPassWordScreen extends StatelessWidget {
  const ForgotPassWordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignInScreen())),
            child:
                const Icon(CupertinoIcons.back, size: 24, color: Colors.red)),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is ForgotPasswordSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pop(context);
          }
          if (state is ForgotPasswordFailedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        listenWhen: (previous, current) => current is AuthActionState,
        buildWhen: (previous, current) => current is! AuthActionState,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "resetText",
                  style: Theme.of(context).textTheme.titleSmall,
                ).tr(),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: CupertinoTextField(
                    keyboardType: TextInputType.emailAddress,
                    style: Theme.of(context).textTheme.titleSmall,
                    controller: _emailController,
                    onEditingComplete: () {
                      BlocProvider.of<AuthBloc>(context).add(
                          ForgotPasswordRequestEvent(
                              email: _emailController.text));
                    },
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(14)),
                    placeholderStyle: const TextStyle(color: Colors.grey),
                    placeholder: 'Email',
                    padding: const EdgeInsets.all(10),
                    prefix: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                        CupertinoIcons.mail_solid,
                        color: CupertinoColors.destructiveRed,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
                CupertinoButton(
                  onPressed: (() {
                    BlocProvider.of<AuthBloc>(context).add(
                        ForgotPasswordRequestEvent(
                            email: _emailController.text));
                  }),
                  color: CupertinoColors.destructiveRed,
                  child: Text("resetPassword",
                          style: Theme.of(context).textTheme.titleSmall)
                      .tr(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
