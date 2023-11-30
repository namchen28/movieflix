import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  ThemeBloc() : super(ThemeMode.dark) {
    _loadTheme();
    on<ThemeChanged>((event, emit) {
      _saveTheme(event.isDark);
      emit(event.isDark ? ThemeMode.dark : ThemeMode.light);
    });
  }

  Future<void> _saveTheme(bool isDark) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', isDark);
  }

  Future<void> _loadTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isDark = prefs.getBool('isDark') ?? true;
    add(ThemeChanged(isDark));
  }
}
