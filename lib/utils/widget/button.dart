import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final Icon iconData;
  const ButtonCustom({super.key, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        width: 48,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black.withOpacity(0.6),
        ),
        child: Icon(
          iconData.icon,
          size: 32,
          color: Colors.white,
        ));
  }
}
