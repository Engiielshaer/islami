import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/provider/theme_provider.dart';
import 'package:islami/ui/screens/hadeth_details/hadeth_details.dart';
import 'package:islami/ui/utils/appAssets.dart';
import 'package:islami/ui/utils/app_color.dart';
import 'package:provider/provider.dart';
import '../../constants/constant.dart';
import '../../models/hadeth.dart';
import '../../models/sura_details_argument.dart';
import '../../ui/screens/sura_details/sura_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Ahadeth extends StatefulWidget {
  Ahadeth({super.key});

  @override
  State<Ahadeth> createState() => _AhadethState();
}

class _AhadethState extends State<Ahadeth> {
  late ThemeProvider themeProvider;
  List<Hadeth> hadethList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readAhadeth();
  }

  @override
  Widget build(BuildContext context) {
    themeProvider=Provider.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 3, child: Image.asset(AppAssets.AhadethTabLogo)),
        Expanded(
          flex: 7,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Divider(color: AppColor.orange, thickness: 2),
                    Row(
                    children: [
                      Expanded(
                          child: Text(
                        AppLocalizations.of(context)!.ahadeth,
                        textAlign: TextAlign.center,
                        style:themeProvider.meduimTitleTextStyle ,
                      )),
                    ],
                  ),
                  Divider(color: AppColor.orange, thickness: 2),
                  Expanded(
                      flex: 7,
                      child:hadethList.isEmpty? CircularProgressIndicator(color: AppColor.orange,) :
                      ListView.builder(
                        itemCount: hadethList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, HadethDetails.routeName,
                                  arguments: hadethList[index]  );
                            },
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  hadethList[index].title,
                                  textAlign: TextAlign.center,
                                  style: themeProvider.regularTitleTextStyle,
                                )),
                              ],
                            ),
                          );
                        },
                      )),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future readAhadeth() async {
    String ahadethContent =
        await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> hadethString = ahadethContent.split("#\r\n");
    for (int i = 0; i < hadethString.length; i++) {
      String hadeth = hadethString[i];
      List<String> hadethLines = hadeth.split("\n");
      String hadethName = hadethLines[0];
      hadethLines.remove(0);
      String hadethContent = hadethLines.join();
      hadethList.add(Hadeth(hadethName.trim(), hadethContent));
    }

    print(hadethList);
    setState(() {});
  }
}
