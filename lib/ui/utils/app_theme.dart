 import 'package:flutter/material.dart';
import 'package:islami/ui/utils/app_color.dart';

abstract class AppTheme{
  static const appBarTextStyle=TextStyle(
      color: AppColor.lightBlack,
      fontWeight: FontWeight.w700,
      fontSize: 30
  );
  static const meduimTitleTextStyle=TextStyle(
      color: AppColor.lightBlack,
      fontWeight: FontWeight.w500,
      fontSize: 26
  );
  static const regularTitleTextStyle=TextStyle(
      color: AppColor.lightBlack,
      fontWeight: FontWeight.w400,
      fontSize: 22
  );


  static const appBarDarkTextStyle=TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 35
  );
  static const meduimTitleDarkTextStyle=TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 26
  );
  static const regularTitleDarkTextStyle=TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 22
  );
  static ThemeData lightTheme=ThemeData(
    primaryColor:const Color(0xffB7935F),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme:const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
          color: AppColor.lightBlack,
          fontWeight: FontWeight.w700,
          fontSize: 30
      )
    ),
    colorScheme:const ColorScheme(
      brightness:Brightness.light ,
      primary: AppColor.orange,
      onPrimary: AppColor.onPrimaryLight,
      secondary:AppColor.lightBlack ,
      onSecondary:AppColor.lightBlack  ,
      error:AppColor.error ,
      onError:AppColor.error ,
      surface:Colors.transparent ,
      onSurface:Colors.transparent ,
      background:Colors.transparent ,
      onBackground: Colors.transparent,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor:AppColor.lightBlack ,
      selectedIconTheme: IconThemeData(size: 40),
      unselectedIconTheme: IconThemeData(size: 32),
        unselectedItemColor: Colors.white
    )
  );
  static ThemeData darkTheme=ThemeData(
      primaryColor:AppColor.darkBlue,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme:const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 30
          )
      ),
      colorScheme:const ColorScheme(
        brightness:Brightness.dark ,
        primary: AppColor.darkBlue,
        onPrimary: AppColor.onDarkBlue,
        secondary:AppColor.yellow ,
        onSecondary:AppColor.yellow  ,
        error:AppColor.error ,
        onError:AppColor.error ,
        surface:Colors.transparent ,
        onSurface:Colors.transparent ,
        background:Colors.transparent ,
        onBackground: Colors.transparent,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor:AppColor.yellow ,
          selectedIconTheme: IconThemeData(size: 36),
          unselectedIconTheme: IconThemeData(size: 32),
        unselectedItemColor: Colors.white
      )
  );
 }