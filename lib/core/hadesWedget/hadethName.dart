import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islameapp/core/hadesWedget/hadesDetails.dart';
import 'package:islameapp/widget_fragment/quran/sura_details.dart';

class hadethName extends StatelessWidget {
  int index;
  String HadethName;

  hadethName(this.HadethName,this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, hadethDetails.Route_Name,arguments:
        HadethDetailsArgs(HadethName, '${index+1}.txt'));
      },
      child: Container(
        child: Text(HadethName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            )),
      ),
    );
  }
}
class HadethDetailsArgs{
  String hadeth;
  String fileName;
  HadethDetailsArgs(this.hadeth,this.fileName);
}
