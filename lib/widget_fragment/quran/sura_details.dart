import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islameapp/theming/my_them_data.dart';
import 'package:islameapp/widget_fragment/quran/soura_name.dart';
import 'package:islameapp/widget_fragment/quran/suraView.dart';

class suraDetais extends StatefulWidget {
  static String Route_Name='suraDetais';


  @override
  State<suraDetais> createState() => _suraDetaisState();
}

class _suraDetaisState extends State<suraDetais> {
  String suraContant ='';
  List<String>suraLines=[];

  @override
  Widget build(BuildContext context) {
    SuraDetailsArgs args =ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs ;
    readSuraFile(args.fileName);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/default_bg.png"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            args.suraName,style: TextStyle(
            fontSize: 30 ,
            fontWeight: FontWeight.bold
          ),
          ),
        ),
        body: suraContant.isEmpty?
        Center(child:CircularProgressIndicator()) :
        Container(child: ListView.separated(
          itemCount: suraLines.length,
          itemBuilder: (context, index) {
          return SuaraView(suraLines[index],index);
        },
          separatorBuilder: (context, index) {
            return Divider(color: ThemData.primryColor,thickness: 2,);
          },
        )
        ),
      ),
    );
  }

  void readSuraFile(String fileName) async{
    String fileComtant = await rootBundle.loadString('assets/files/${fileName}');
    suraContant=fileComtant;
     suraContant=suraContant.trim();
    suraLines=suraContant.split('\n');
    setState(() {

    });
  }
}

