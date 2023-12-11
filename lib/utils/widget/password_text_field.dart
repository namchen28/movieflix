import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.obscureText,
    required TextEditingController passwordController,
    required this.placeHolder,
  }) : _passwordController = passwordController;

  final bool obscureText;
  final String placeHolder;
  final TextEditingController _passwordController;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;
  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
        cursorColor: Colors.red,
        obscureText: obscureText,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(14)),
        placeholderStyle: const TextStyle(color: Colors.grey),
        controller: widget._passwordController,
        placeholder: widget.placeHolder,
        padding: const EdgeInsets.all(10),
        suffix: GestureDetector(
          onTap: () {
            toggle();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              obscureText
                  ? CupertinoIcons.eye_slash_fill
                  : CupertinoIcons.eye_fill,
              color: CupertinoColors.systemGrey,
              size: 24,
            ),
          ),
        ),
        style: Theme.of(context).textTheme.titleSmall);
  }
}
