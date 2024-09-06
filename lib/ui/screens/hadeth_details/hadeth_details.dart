
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/models/hadeth.dart';
import 'package:islami/models/sura_details_argument.dart';
import 'package:islami/ui/utils/app_color.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName='HadethDetails';
  HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {


  String  fileContent="";
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider=Provider.of(context);
   Hadeth hadeth=ModalRoute.of(context)!.settings .arguments as Hadeth;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(themeProvider.mainBackground))
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title:  Text(
            "${hadeth.title}",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30
            ),
          ),
          elevation: 0,
        ),
        body:
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width *.8,
            height: MediaQuery.of(context).size.height *.8,
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25)
            ),
            child: SingleChildScrollView(
              child: Text(
                hadeth.content,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColor.lightBlack,
                  fontSize: 17
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


}
