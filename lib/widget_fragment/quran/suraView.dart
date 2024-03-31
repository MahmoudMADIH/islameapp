import 'package:flutter/cupertino.dart';

class SuaraView extends StatelessWidget {
  int index;

  String View;

  SuaraView(this.View, this.index);

  @override
  Widget build(BuildContext context) {
    // View=(index+1).toString()+View;
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
                 Expanded(
                       child:Text('${View}',
                      softWrap: true,
                     maxLines: 6,
                      textHeightBehavior: TextHeightBehavior(applyHeightToLastDescent: true),
                      textAlign: TextAlign.center,
                            style: TextStyle(
                         fontWeight: FontWeight.w400,
                      fontSize: 18
        ),)),
      ],
    ),);
  }
}
