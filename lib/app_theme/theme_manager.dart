

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'theme_manager.g.dart';

@Riverpod(keepAlive: true)
class ThemeManager extends _$ThemeManager{
  final _sharedPreferencesInstance = SharedPreferences.getInstance();

@override
  ThemeMode build(){
  _getTheme();
    return ThemeMode.system;
  }

  void switchTheme({required ThemeMode mode}){
  _saveTheme(themeName: mode.name);
   state = mode;
  }

  Future<void> _saveTheme({required String themeName})async{
    final instance = await _sharedPreferencesInstance;
    await instance.setString("themeName", themeName);
  }


  Future<void> _getTheme()async{
    final instance = await _sharedPreferencesInstance;
    final theme = instance.getString("themeName");
    switch(theme){
      case "dark":
        state = ThemeMode.dark;
        break;
      case "light":
        state = ThemeMode.light;
        break;
      case "system":
        state = ThemeMode.system;
        break;
      default:
        state = ThemeMode.light;
        break;
    }
  }


}