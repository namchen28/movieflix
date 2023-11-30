import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieflix/auth/auth_bloc.dart';
import 'package:movieflix/auth_main.dart';
import 'package:movieflix/auth_repository.dart';
import 'package:movieflix/bloc/theme.dart';
import 'package:movieflix/bloc/theme_bloc.dart';
import 'package:movieflix/home_bloc/home_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('vi'),
          Locale('en'),
        ],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('en'),
        child: const MainApp()),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => AuthRepository(),
        child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => HomeBloc()..add(HomeInitialEvent()),
              ),
              BlocProvider(
                create: (context) => ThemeBloc(),
              ),
              BlocProvider(
                  create: (context) =>
                      AuthBloc(authRepository: context.read<AuthRepository>())),
            ],
            child: MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              darkTheme: darkTheme,
              themeMode: ThemeMode.dark,
              theme: lightTheme,
              home: AuthMain(),
              builder: (context, child) {
                return BlocBuilder<ThemeBloc, ThemeMode>(
                  builder: (context, state) {
                    return Theme(
                      child: child ?? SizedBox(),
                      data: state == ThemeMode.dark ? darkTheme : lightTheme,
                    );
                  },
                );
              },
              // home: Builder(builder: (context) {
              //   return Scaffold(
              //     body: navScreens.elementAt(currentIndex),
              //     bottomNavigationBar:
              //         BottomNavBar(),
              //   );
              // }),
            )));
  }
}
