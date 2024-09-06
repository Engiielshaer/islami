
import 'package:flutter/material.dart';
import 'package:islami/tabs/ahadeth/ahadeth.dart';
import 'package:islami/tabs/quran/quran.dart';
import 'package:islami/tabs/radio/radio.dart';
import 'package:islami/tabs/sebha/sebha.dart';
import 'package:islami/tabs/settings/settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/ui/provider/theme_provider.dart';
import 'package:islami/ui/utils/appAssets.dart';
import 'package:islami/ui/utils/app_color.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static const String routeName="home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIconIndex=0;
  List<Widget> tabs=[Quran(),Ahadeth(),Sebha(), RadioScreen(),Settings()];
  late ThemeProvider themeProvider;
  @override
  Widget build(BuildContext context) {
    themeProvider=Provider.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(themeProvider.mainBackground))
      ),
      child: Scaffold(
        appBar: buildAppBar(),
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Theme(
          data:  Theme.of(context).copyWith(canvasColor: Theme.of(context).primaryColor),
          child: BottomNavigationBar(
            currentIndex: selectedIconIndex,
            onTap: (index){
              selectedIconIndex=index;
              setState(() {
                
              });
            },
            items:  [
              BottomNavigationBarItem(
                  icon:ImageIcon(AssetImage(AppAssets.icQuraan)) ,
                  label:AppLocalizations.of(context)!.quran ),
              BottomNavigationBarItem(
                  icon:ImageIcon(AssetImage(AppAssets.icAhadeth)) ,
                  label:AppLocalizations.of(context)!.hadeth ),
              BottomNavigationBarItem(
                  icon:ImageIcon(AssetImage(AppAssets.icsebha)) ,
                  label:AppLocalizations.of(context)!.sebha ),
              BottomNavigationBarItem(
                  icon:ImageIcon(AssetImage(AppAssets.icRadio)) ,
                  label:AppLocalizations.of(context)!.radio ),
              BottomNavigationBarItem(
                  icon:Icon(Icons.settings) ,
                  label:AppLocalizations.of(context)!.settings ),

            ],
          ),
        ),
        body: tabs[selectedIconIndex],

      ),
    );
  }

  AppBar buildAppBar() => AppBar(
    backgroundColor: Colors.transparent,
    title: Text(
      AppLocalizations.of(context)!.islami,
      style: themeProvider.appBarTextStyle,
    ),

  );
}
