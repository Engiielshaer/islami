import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/ui/provider/languageProvider.dart';
import 'package:islami/ui/provider/theme_provider.dart';
import 'package:islami/ui/screens/hadeth_details/hadeth_details.dart';
import 'package:islami/ui/screens/home/home.dart';
import 'package:islami/ui/screens/splash/splash.dart';
import 'package:islami/ui/screens/sura_details/sura_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/ui/utils/app_theme.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>LanguageProvider(),),
        ChangeNotifierProvider(create: (_)=>ThemeProvider()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageProvider provider= Provider.of(context);
    ThemeProvider themeProvider = Provider.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates:const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales:const [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      locale:  Locale(provider.locale),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.currentThemeMode,
      routes: {
        Splash.routeName:(_)=>Splash(),
        Home.routeName:(_)=>Home(),
        SuraDetails.routeName:(_)=>SuraDetails(),
        HadethDetails.routeName:(_)=>HadethDetails(),

      },
      initialRoute: Splash.routeName,
    );
  }
}


