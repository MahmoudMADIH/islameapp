import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islameapp/core/suraWidget/suraWidget.dart';
import 'package:islameapp/theming/my_them_data.dart';
import 'package:islameapp/widget_fragment/quran/soura_name.dart';
import 'package:islameapp/widget_fragment/quran/suraView.dart';

import '../../widget_fragment/ahades/ahades.dart';
import '../../widget_fragment/quran/quran.dart';
import '../../widget_fragment/radio/radio.dart';
import '../../widget_fragment/sebha/sebha.dart';

class suraDetails extends StatefulWidget {
  static String Route_Name = 'suraDetails';

  @override
  State<suraDetails> createState() => _suraDetaisState();
}

class _suraDetaisState extends State<suraDetails> {
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/default_bg.png"))),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "اسلامي",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          body:suraWidget(),

          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor:Color(0xffB7935F)),
            // canvasColor: Color(0xffB7935F)

            child: BottomNavigationBar(
              onTap: (value) {
                currentIndex=value;
                setState(() {
                });
                print(value);
                print(currentIndex);
              },
              selectedItemColor: Color(0xff0F1424),
              backgroundColor: const Color(0xffB7935F),
              currentIndex:currentIndex,
              items:[
                BottomNavigationBarItem(
                    label: "Qouran",
                    icon: ImageIcon(AssetImage("assets/images/icon_quran.png"))),
                BottomNavigationBarItem(
                    label: "hedeth",
                    icon: ImageIcon(AssetImage("assets/images/icon_hadeth.png"))),
                BottomNavigationBarItem(
                    label: "Qouran",
                    icon: ImageIcon(AssetImage("assets/images/icon_radio.png"))),
                BottomNavigationBarItem(
                    label: "Qouran",
                    icon: ImageIcon(AssetImage("assets/images/icon_sebha.png"))),
              ],
            ),
          )),



    );
  }
  Widget? getBody(){
    if(currentIndex==0){
      return quarnFragmant();
    }if(currentIndex==1){
      return ahadesFragment();
    }
    if(currentIndex==2){
      return radioFragment();
    }if(currentIndex==3){
      return sebhaFragment();
    }
  }
}
