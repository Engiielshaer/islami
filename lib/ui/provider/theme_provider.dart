import 'package:flutter/material.dart';
import 'package:islami/ui/utils/appAssets.dart';
import 'package:islami/ui/utils/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode currentThemeMode=ThemeMode.light;
  late SharedPreferences storage;

  toggleTheme(bool themeSwitchValue){
    currentThemeMode=themeSwitchValue? ThemeMode.dark :ThemeMode.light;
    notifyListeners();
    bool isDark=currentThemeMode==ThemeMode.dark ? true : false;
    saveTheme(isDark);
  }
  void saveTheme(bool isDark)
  {
     storage.setBool('isDark', isDark);
  }

  String get mainBackground =>
      currentThemeMode==ThemeMode.light?AppAssets.background: AppAssets.darkBackground;

  TextStyle get appBarTextStyle=>
      currentThemeMode==ThemeMode.light?AppTheme.appBarTextStyle:AppTheme.appBarDarkTextStyle;

  TextStyle get meduimTitleTextStyle=>
      currentThemeMode==ThemeMode.light?AppTheme.meduimTitleTextStyle:AppTheme.meduimTitleDarkTextStyle;

  TextStyle get regularTitleTextStyle=>
      currentThemeMode==ThemeMode.light?AppTheme.regularTitleTextStyle:AppTheme.regularTitleDarkTextStyle;

}