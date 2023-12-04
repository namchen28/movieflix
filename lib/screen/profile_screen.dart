import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieflix/auth/bloc/auth_bloc.dart';
import 'package:movieflix/auth/auth_main.dart';

import 'package:movieflix/favorite_movie/presentation/favorite_screen.dart';
import 'package:movieflix/theme/bloc/theme_bloc.dart';
import 'package:movieflix/screen/reset_password_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 8, right: 8),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CupertinoButton(
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
                        const SizedBox(height: 20),
                        Center(
                          child: Text(
                            '${user.email}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Divider(),
                        CupertinoButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ResetPasswordScreen(),
                            ));
                          },
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              const Icon(
                                CupertinoIcons.pencil,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                'resetPassword',
                                style: Theme.of(context).textTheme.titleSmall,
                              ).tr(),
                              const Spacer(),
                              const Icon(CupertinoIcons.right_chevron)
                            ],
                          ),
                        ),
                        const Divider(),
                        CupertinoButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const FavoriteMoviesScreen()));
                          },
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              const Icon(
                                CupertinoIcons.bookmark,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                'watchList',
                                style: Theme.of(context).textTheme.titleSmall,
                              ).tr(),
                              const Spacer(),
                              const Icon(CupertinoIcons.right_chevron)
                            ],
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              const Icon(CupertinoIcons.globe),
                              const SizedBox(width: 8),
                              Text(
                                'language',
                                style: Theme.of(context).textTheme.titleSmall,
                              ).tr(),
                              const Spacer(),
                              DropdownMenu(
                                width: 160,
                                onSelected: (value) {
                                  context.setLocale(Locale(value!));
                                },
                                initialSelection:
                                    Localizations.localeOf(context)
                                        .languageCode,
                                dropdownMenuEntries: const [
                                  DropdownMenuEntry(
                                      value: 'en', label: 'English'),
                                  DropdownMenuEntry(
                                      value: 'vi', label: 'Tiếng Việt')
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              const Icon(CupertinoIcons.moon),
                              const SizedBox(width: 8),
                              Text(
                                'darkMode',
                                style: Theme.of(context).textTheme.titleSmall,
                              ).tr(),
                              const Spacer(),
                              BlocBuilder<ThemeBloc, ThemeMode>(
                                builder: (context, state) {
                                  return CupertinoSwitch(
                                    activeColor: CupertinoColors.destructiveRed,
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
                            ],
                          ),
                        ),
                        const Divider(),
                        BlocConsumer<AuthBloc, AuthState>(
                          listener: (context, state) {
                            (context, state) {
                              if (state is SignOutSuccessState) {
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => const AuthMain()),
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
                            return CupertinoButton(
                              onPressed: () {
                                context.read<AuthBloc>().add(SignOutRequest());
                              },
                              child: const Text(
                                'logOut',
                                style: TextStyle(
                                    color: CupertinoColors.destructiveRed),
                              ).tr(),
                            );
                          },
                        ),
                      ]),
                ))),
      ),
    );
  }
}
