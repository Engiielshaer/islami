

import 'package:flutter/material.dart';


import 'package:islami/constants/constant.dart';
import 'package:islami/models/sura_details_argument.dart';
import 'package:islami/ui/provider/theme_provider.dart';
import 'package:islami/ui/screens/sura_details/sura_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/ui/utils/appAssets.dart';
import 'package:islami/ui/utils/app_color.dart';
import 'package:provider/provider.dart';


class Quran extends StatelessWidget {
  late ThemeProvider themeProvider;
    Quran({super.key});

  @override
  Widget build(BuildContext context) {
    themeProvider=Provider.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
            child: Image.asset(AppAssets.QuranTabLogo)
        ),
        Expanded(
          flex: 7,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Divider(color: AppColor.orange,thickness: 2),
                    Row(
                    children: [
                      Expanded(child: Text(
                        AppLocalizations.of(context)!.suraName,
                        textAlign: TextAlign.center,
                        style:themeProvider.meduimTitleTextStyle ,
                      )),
                      Expanded(
                          child: Text(
                            AppLocalizations.of(context)!.verses,
                            textAlign: TextAlign.center,
                            style:themeProvider.meduimTitleTextStyle ,
                          ))
                    ],
                  ),
                  Divider(color: AppColor.orange,thickness: 2),
                  Expanded(
                      flex: 7,
                      child:ListView.builder(
                        itemCount: Constant.suraNames.length,
                        itemBuilder: (context,index){
                          return   InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, SuraDetails.routeName,
                                  arguments: SuraDetailsArg(suraName: Constant.suraNames[index],
                                      fileName: '${index+1}.txt') );
                            },
                            child: Row(
                              children: [
                                Expanded(child: Text(
                                  Constant.suraNames[index],
                                  textAlign: TextAlign.center,
                                  style:themeProvider.regularTitleTextStyle ,
                                )),
                                Expanded(
                                    child: Text(
                                      Constant.versesNumber[index].toString(),
                                      textAlign: TextAlign.center,
                                      style:themeProvider.regularTitleTextStyle ,
                                    ))
                              ],
                            ),
                          );
                        },

                      ) ),
                ],
              ),
              VerticalDivider(color: AppColor.orange,thickness: 2,indent: 8,)
            ],
          ),
        ),
      ],
    );
  }
}
