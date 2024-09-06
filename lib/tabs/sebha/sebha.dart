
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami/ui/utils/app_color.dart';

class Sebha extends StatefulWidget {
   const Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  int counter=0;
  int sebhaIndex=0;
  double turn=0;

  final List<String>sebhaWord=[
    'سبحان الله',
    'الحمدلله',
    'لااله الا الله',
    'الله اكبر',
    'لا حول ولا قوة الا بالله',

  ];
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.all(8.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding:   EdgeInsets.only(left: MediaQuery.of(context).size.width*.28),
                  child: Image.asset('assets/images/head_sebha_logo.png'),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top:MediaQuery.of(context).size.height*.08),
                  child: AnimatedRotation(
                    duration:Duration(milliseconds: 300),
                      turns: turn,
                      child: Image.asset('assets/images/body_sebha_logo.png')),
                ),
              ],
            ),
          ),
          SizedBox(height: 40,),
          const Text(
            'عدد التسبيحات',
            style: TextStyle(
              color: AppColor.lightBlack,
                fontSize: 23,
                fontWeight: FontWeight.w700
            ),
          ),
          SizedBox(height: 22,),
      Container(
        width: 50,
        height: 65,
        decoration: BoxDecoration(
            color: AppColor.orange.withOpacity(.5),
            borderRadius: BorderRadius.circular(15)
        ),
        child: Center(child: Text(
          counter.toString(),
          style: TextStyle(
              color: AppColor.lightBlack,
              fontSize: 20
          ),
        )),
      ),
          SizedBox(height: 22,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.orange
            ),
              onPressed: (){
              setState(() {
                counter++;
                turn+=.25;
                if(counter==34){
                  counter=0;
                  sebhaIndex++;
                   if(sebhaIndex==sebhaWord.length){
                     sebhaIndex=0;
                   }
                }
              });
              },
              child:  Text(
                sebhaWord[sebhaIndex],
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20
                ),
              ))



        ],
      ),
    );
  }
}
