import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required TextEditingController emailController,
    required this.placeHolder,
  }) : _emailController = emailController;

  final TextEditingController _emailController;
  final String placeHolder;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
        cursorColor: Colors.red,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(14)),
        placeholderStyle: const TextStyle(color: Colors.grey),
        controller: _emailController,
        placeholder: placeHolder,
        padding: const EdgeInsets.all(10),
        style: Theme.of(context).textTheme.titleSmall);
  }
}
