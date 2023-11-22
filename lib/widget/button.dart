import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final Icon iconData;
  const ButtonCustom({super.key, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: 40,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black.withOpacity(0.6),
        ),
        child: Icon(
          iconData.icon,
          size: 24,
          color: Colors.white,
        ));
  }
}
