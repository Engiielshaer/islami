
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/ui/provider/languageProvider.dart';
import 'package:islami/ui/provider/theme_provider.dart';
import 'package:islami/ui/utils/app_color.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {

   const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isDarkThem=false;
  late LanguageProvider provider;
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    provider=Provider.of(context);
    themeProvider=Provider.of(context);
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
              style: themeProvider.meduimTitleTextStyle,
          ),
          buildDrobDownLanguage(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  AppLocalizations.of(context)!.theme,
                style: themeProvider.meduimTitleTextStyle,
              ),
              buildSwitchThem()
            ],
          ),


              ]

          ),
    );


  }

  Widget buildDrobDownLanguage() =>DropdownButton(
     isExpanded: true,
    value:  provider.locale ,
      items: [
        DropdownMenuItem(
            value: "ar",
            child: Text("العربيه",style: themeProvider.regularTitleTextStyle,)),
        DropdownMenuItem(
            value: "en",
            child: Text("English",style: themeProvider.regularTitleTextStyle,)),
      ],
      onChanged: (value){

       provider.locale=value?? provider.locale;
       provider.notifyListeners();
        setState(() {

        });
      });

      
      

  Widget buildSwitchThem() => Switch(
      value: themeProvider.currentThemeMode==ThemeMode.dark,
      activeColor: AppColor.orange,
         
      onChanged: (newValue)
  {
     themeProvider.toggleTheme(newValue);


  });
}
