import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier{
  late SharedPreferences storage;
  String locale="ar";
  Locale currentLocal=const Locale('ar');

  Future<void>getlang()async{
    storage=await SharedPreferences.getInstance();
    if(storage.getBool('isArabic')?? false)
    {
      currentLocal= const Locale('ar');
    }
    else{
      currentLocal=const Locale('en');
    }
  }

  changeLocal( Locale locale){
    currentLocal=locale;
    //currentLocal=value?currentLocal: Locale('en');
    notifyListeners();
    bool isArabic=locale==const Locale('ar') ?true :false;
    saveLang(isArabic);
  }


  void saveLang(bool isArabic){
    storage.setBool('isArabic', isArabic);
  }
}
