import 'package:flutter/cupertino.dart';

class SuaraView extends StatelessWidget {
  int index ;
 String View;
SuaraView(this.View,this.index);

  @override
  Widget build(BuildContext context) {

    View=(index+1).toString()+View;
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Text('${View}' ,maxLines: 6,textHeightBehavior: TextHeightBehavior(applyHeightToLastDescent: true),textAlign: TextAlign.end,style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18
          ),),
        ],
      ),
    );
  }
}
