import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:islameapp/widget_fragment/quran/quran.dart';
import 'package:islameapp/widget_fragment/sebha/sebha.dart';

import '../widget_fragment/ahades/ahades.dart';
import '../widget_fragment/radio/radio.dart';

class Home extends StatefulWidget {
  static String ROUTE_NAME = "home";


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(

          image: DecorationImage(
              image: AssetImage("assets/images/default_bg.png"),)),
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
          body: getBody(),
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
      return SebhaFragment();
    }
  }
}
