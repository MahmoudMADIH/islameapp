import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islameapp/core/hadesWedget/hadethName.dart';
import 'package:islameapp/core/hadesWedget/hadethView.dart';

import '../../theming/my_them_data.dart';

class hadethWidget extends StatefulWidget {
  const hadethWidget({super.key});

  @override
  State<hadethWidget> createState() => _hadethWidgetState();
}

class _hadethWidgetState extends State<hadethWidget> {
  String hadethContant = '';
  List<String>hadethLines = [];

  @override
  Widget build(BuildContext context) {
    HadethDetailsArgs args = ModalRoute
        .of(context)!
        .settings
        .arguments as HadethDetailsArgs;
    readHadethFile(args.fileName);
    return Scaffold(
      backgroundColor: Colors.white30,
      endDrawerEnableOpenDragGesture: true,

      // margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      // padding: EdgeInsets.all(8),
      // color: Colors.black26,
      body:
      Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        padding: EdgeInsets.all(8),

        child: Column(

            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                        Icons.play_arrow
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemData.primryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.start,
                    args.hadeth, style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold),),

                ],
              ),
              Container(
                width: double.infinity,
                color: ThemData.primryColor,
                height: 2,
              ),
              //   suraContant.isEmpty?
              // Center(child:CircularProgressIndicator()) :
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: hadethLines.length,
                    itemBuilder: (context, index) {
                      return hadethView(hadethLines[index], index);
                    },
                  ),
                ),)


            ]),
      ),
    );
  }

  void readHadethFile(String fileName) async {
    String fileContant = await rootBundle.loadString(
        'assets/ahadeth/${fileName}');
    hadethContant = fileContant;
    hadethContant = hadethContant.trim();
    hadethLines = hadethContant.split('\n');
    setState(() {

    });
  }
}
