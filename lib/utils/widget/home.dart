import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieflix/features/movie/presentation/movie_screen.dart';

import '../../features/movie/bloc/home_bloc.dart';
import '../../features/search/presentation/search_screen.dart';
import '../../screen/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  List navScreens = [
    const MovieScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];

  void changeScreen(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: navScreens.elementAt(_currentIndex),
        bottomNavigationBar: Builder(builder: (context) {
          return BottomNavigationBar(
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
          );
        }));
  }
}
