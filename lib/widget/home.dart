import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieflix/home_bloc/home_bloc.dart';
import 'package:movieflix/screen/movie_screen.dart';
import 'package:movieflix/screen/profile_screen.dart';
import 'package:movieflix/screen/search_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  List navScreens = [
    MovieScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  void changeScreen(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeBloc>().add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: navScreens.elementAt(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              label: "movie".tr(),
              icon: const Icon(
                Icons.movie_creation_rounded,
              ),
            ),
            BottomNavigationBarItem(
              label: "search".tr(),
              icon: const Icon(
                Icons.search_rounded,
              ),
            ),
            BottomNavigationBarItem(
              label: 'profile'.tr(),
              icon: const Icon(
                Icons.person,
              ),
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) => {
            setState(
              () {
                _currentIndex = index;
              },
            )
          },
        ));
  }
}
