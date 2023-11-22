import 'package:flutter/cupertino.dart';

class ForgotPassDialog extends StatelessWidget {
  const ForgotPassDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Reset your password'),
      content: Container(
        margin: const EdgeInsets.all(8),
        child: const CupertinoTextField(
          placeholder: 'Enter your email',
        ),
      ),
      actions: [
        CupertinoButton(
          child: const Text(
            'Reset',
          ),
          onPressed: () {},
        ),
        CupertinoButton(
          child: const Text('Cancel'),
          onPressed: () {},
        )
      ],
    );
  }
}
