import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello Nam!'),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dark Mode'),
                CupertinoSwitch(
                  value: true,
                  onChanged: (value) {},
                )
              ],
            ),
            TextButton(onPressed: () {}, child: Text('Edit profile')),
            TextButton(onPressed: () {}, child: Text('Watchlist')),
            TextButton(onPressed: () {}, child: Text('Choose Languages')),
            TextButton(onPressed: () {}, child: Text('Logout'))
          ],
        ),
      ),
    );
  }
}
