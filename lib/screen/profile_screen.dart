import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieflix/auth/auth_bloc.dart';
import 'package:movieflix/auth_main.dart';

import 'package:movieflix/bloc/theme_bloc.dart';
import 'package:movieflix/favorite_movie/ui/favorite_screen.dart';
import 'package:movieflix/screen/reset_password_screen.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      body: SingleChildScrollView(
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundColor: CupertinoColors.systemRed,
                          child: Icon(
                            CupertinoIcons.person,
                            size: 60,
                            color: CupertinoColors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        '${user.email}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const SizedBox(height: 20),
                    buildProfileButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ResetPasswordScreen(),
                        ));
                      },
                      icon: CupertinoIcons.pencil,
                      label: 'Reset Password',
                    ),
                    buildProfileButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FavoriteMoviesScreen()));
                      },
                      icon: CupertinoIcons.bookmark,
                      label: 'Watchlist',
                    ),
                    Row(
                      children: [
                        const Icon(CupertinoIcons.globe),
                        const SizedBox(width: 8),
                        const Text('language').tr(),
                        const Spacer(),
                        DropdownMenu(
                          onSelected: (value) {
                            context.setLocale(Locale(value!));
                          },
                          initialSelection:
                              Localizations.localeOf(context).languageCode,
                          dropdownMenuEntries: const [
                            DropdownMenuEntry(value: 'en', label: 'English'),
                            DropdownMenuEntry(value: 'vi', label: 'Tiếng Việt')
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('darkMode').tr(),
                        BlocBuilder<ThemeBloc, ThemeMode>(
                          builder: (context, state) {
                            return CupertinoSwitch(
                              value: context.read<ThemeBloc>().state ==
                                  ThemeMode.dark,
                              onChanged: (value) {
                                context
                                    .read<ThemeBloc>()
                                    .add(ThemeChanged(value));
                              },
                            );
                          },
                        ),
                        BlocConsumer<AuthBloc, AuthState>(
                          listener: (context, state) {
                            (context, state) {
                              if (state is SignOutSuccessState) {
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => AuthMain()),
                                  (route) => false,
                                );
                              }
                            };
                          },
                          listenWhen: (previous, current) =>
                              current is AuthActionState,
                          buildWhen: (previous, current) =>
                              current is! AuthActionState,
                          builder: (context, state) {
                            return buildProfileButton(
                              onPressed: () {
                                context.read<AuthBloc>().add(SignOutRequest());
                              },
                              label: 'logOut'.tr(),
                            );
                          },
                        ),
                      ],
                    ),
                  ]))),
    );
  }
}

Widget buildProfileButton(
    {required VoidCallback onPressed, IconData? icon, required String label}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: CupertinoButton(
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (icon != null) Icon(icon),
          Text(label).tr(),
          SizedBox(width: icon != null ? 8.0 : 0),
        ],
      ),
    ),
  );
}

Widget buildLanguageDropdown(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        const Icon(CupertinoIcons.globe),
        const SizedBox(width: 8),
        const Text('language').tr(),
        const Spacer(),
        DropdownMenu(
          onSelected: (value) {
            context.setLocale(Locale(value!));
          },
          initialSelection: Localizations.localeOf(context).languageCode,
          dropdownMenuEntries: const [
            DropdownMenuEntry(value: 'en', label: 'English'),
            DropdownMenuEntry(value: 'vi', label: 'Tiếng Việt')
          ],
        ),
      ],
    ),
  );
}

Widget buildDarkModeSwitch(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('darkMode').tr(),
        CupertinoSwitch(
          value: context.read<ThemeBloc>().state == ThemeMode.dark,
          onChanged: (value) {
            context.read<ThemeBloc>().add(ThemeChanged(value));
          },
        ),
      ],
    ),
  );
}
