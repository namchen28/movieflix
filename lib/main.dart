import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieflix/home_bloc/home_bloc.dart';
import 'package:movieflix/screen/home_screen.dart';
import 'package:movieflix/screen/profile_screen.dart';
import 'package:movieflix/screen/search_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;

  List navScreens = [
    const HomeScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeInitialEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.black,
                selectedItemColor: CupertinoColors.destructiveRed),
            scaffoldBackgroundColor: const Color.fromARGB(255, 50, 50, 50),
            textTheme: Typography.whiteCupertino,
            cupertinoOverrideTheme: const CupertinoThemeData(
                primaryColor: CupertinoColors.destructiveRed),
            unselectedWidgetColor: CupertinoColors.white),
        home: Scaffold(
          body: navScreens.elementAt(_currentIndex),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                label: "Movies",
                icon: Icon(
                  Icons.movie_creation_rounded,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Search',
                icon: Icon(
                  Icons.search_rounded,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(
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
          ),
        ),
      ),
    );
  }
}
