import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier{
  late SharedPreferences storage;
  String locale="en";
  Locale currentLocal=const Locale('en');


  changeLocal( Locale locale){
    currentLocal=locale;
    //currentLocal=value?currentLocal: Locale('en');
    notifyListeners();
    bool isArabic=locale==const Locale('en') ?true :false;
    saveLang(isArabic);
  }


  void saveLang(bool isArabic){
    storage.setBool('isArabic', isArabic);
  }
}
