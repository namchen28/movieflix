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

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 8),
            physics: BouncingScrollPhysics(),
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
                        // buildProfileButton(
                        //   onPressed: () {
                        //     Navigator.of(context).push(MaterialPageRoute(
                        //       builder: (context) => ResetPasswordScreen(),
                        //     ));
                        //   },
                        //   icon: CupertinoIcons.pencil,
                        //   label: 'Reset Password',
                        // ),
                        Divider(),
                        CupertinoButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ResetPasswordScreen(),
                            ));
                          },
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.pencil,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text('resetPassword').tr(),
                              Spacer(),
                              Icon(CupertinoIcons.right_chevron)
                            ],
                          ),
                        ),
                        Divider(),
                        CupertinoButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        FavoriteMoviesScreen()));
                          },
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.bookmark,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text('watchList').tr(),
                              Spacer(),
                              Icon(CupertinoIcons.right_chevron)
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              const Icon(CupertinoIcons.globe),
                              const SizedBox(width: 8),
                              const Text('language').tr(),
                              Spacer(),
                              DropdownMenu(
                                width: 160,
                                onSelected: (value) {
                                  context.setLocale(Locale(value!));
                                },
                                initialSelection:
                                    Localizations.localeOf(context)
                                        .languageCode,
                                dropdownMenuEntries: [
                                  DropdownMenuEntry(
                                      value: 'en', label: 'English'),
                                  DropdownMenuEntry(
                                      value: 'vi', label: 'Tiếng Việt')
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              const Icon(CupertinoIcons.moon),
                              const SizedBox(width: 8),
                              Text('darkMode').tr(),
                              Spacer(),
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
                        Divider(),
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
                            return CupertinoButton(
                              onPressed: () {
                                context.read<AuthBloc>().add(SignOutRequest());
                              },
                              child: Text(
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
