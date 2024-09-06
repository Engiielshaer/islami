
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/models/sura_details_argument.dart';
import 'package:islami/ui/utils/app_color.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName='suraDetails';
  SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
 late SuraDetailsArg args;

  String  fileContent="";
 late ThemeProvider themeProvider;
  @override
  Widget build(BuildContext context) {
    themeProvider=Provider.of(context);
    args=ModalRoute.of(context)!.settings .arguments as SuraDetailsArg;
    if(fileContent.isEmpty){
      readfile();
    }

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
            "${args.suraName}",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30
            ),
          ),
          elevation: 0,
        ),
        body:fileContent.isEmpty?CircularProgressIndicator(color: Color(0xffB7935F),):
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
                fileContent,
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

   Future readfile() async{
     fileContent=await rootBundle.loadString("assets/files/quran/${args.fileName}" );
     List<String>fileLines=fileContent.split("\n");
     fileLines=fileLines.where((line) => line.trim().isNotEmpty ).toList();
     for(int i=0; i<fileLines.length; i++){
       fileLines[i] +="(${i+1})";
     }

     fileContent=fileLines.join();
     setState(() {

     });

   }
}
