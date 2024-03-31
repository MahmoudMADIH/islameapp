//ahadesFragment
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islameapp/core/hadesWedget/hadethName.dart';
import 'package:islameapp/widget_fragment/quran/soura_name.dart';

import '../../theming/my_them_data.dart';

class ahadesFragment extends StatelessWidget {
  List<String> hadetName =[
    "الحد يث الأول","الحد يث الثاني","الحد يث الـثـالـث","الحد يث الـرابع","الحد يث الخامس", "الحد يث السادس","الحد يث السابع","الحد يث الثامن","الحديث التاسع","الحديث العاشر","الحديث الحادي عشر","الحد يث الثاني عشر","الحد يث الثالث عشر","الحد يث الرابع عشر","الحد يث الخامس عشر","الحديث السادس عشر","الحديث السابع عشر","الحديث الثامن عشر","الحديث التاسع عشر","الحد يث العشرون","الحديث الحادي والعشرون","الحديث الثاني والعشرون","الحديث الثالث والعشرون","الـحديث الرابع والعشرون","الحديث الخامس والعشرون","الحد يث السادس والعشرون","الحد يث السابع والعشرون","الحد يث الثامن والعشرون","الحد يث التاسع والعشرون","الحديث الثلا ثــون","الـحديث الحادي والثلاثون","الحديث الثاني والثلاثون","الحد يث الثالث والثلاثون","الحد يث الرابع والثلاثون","الحد يث الخامس والثلاثون","الحد يث السادس والثلاثون","الحديث السابع والثلاثون","الـحديث الثامن والثلاثون","الحديث التاسع والثلاثون","الحد يث الأربعون","الحد يث الحادي والأربعون","الحد يث الثاني والأربعـون","الحد يث الثالث والأربعون","الحديث الرابع والأربعون","الـحديث الخامس والأربعون", "الحديث السادس والأربعون","الحديث السابع والأربعون","الـحديث الثامن والأربعون","الحديث التاسع والأربعون","الحديث الخمسون"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 3,
              child: Image.asset("assets/images/hadeth_logo.png")),
          Container(
            width: double.infinity,
            color: ThemData.primryColor,
            height: 2,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical :4),
            child: Text(
              "الأحاديث",
              textAlign: TextAlign.center,
              style: TextStyle(

                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: ThemData.primryColor,
            height: 2,
          ),
          Expanded(
              flex: 7,
              child: Container(
                child:ListView.separated(
                    separatorBuilder:(context,index){
                      return Divider(color:ThemData.primryColor,thickness: 2,);
                    },
                    itemCount: hadetName.length,
                    itemBuilder: (context ,index){
                      return hadethName(hadetName[index],index);
                    }) ,

              )),
        ],
      ),
    );
  }
}
