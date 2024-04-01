import 'dart:math' as math; // Import the math library for rotations

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theming/my_them_data.dart';

class SebhaFragment extends StatefulWidget {
  const SebhaFragment({super.key});

  @override
  State<SebhaFragment> createState() => _SebhaFragmentState();
}

class _SebhaFragmentState extends State<SebhaFragment> {
  int index=0;
  int numTasbeh = 0; // Use camelCase for variable names

  double _imageAngle = 0.0; // Track image rotation angle
  double _vibrationAngle = 0.0; // Track image vibration angle


  List<String> typeOfTasabeh = ['الله اكبر', 'سبحان الله', 'الحمد لله'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 8,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _imageAngle += math.pi/33; // Rotate image by 180 degrees
                numTasbeh++;
                TypeOfTasabeh();
                _vibrationAngle = math.Random().nextDouble() * 0.1 - 0.05;
              });
            },
            child: Transform(
              alignment: Alignment.center, // Rotate around image centerrotateZ(_imageAngle)
              transform: Matrix4.identity()..rotateZ(_imageAngle)
              ..translate(0.0,_vibrationAngle*10), // Apply rotation
              child: Image.asset("assets/images/sebha.png"),
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'عدد التسبيحات',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                '$numTasbeh',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                  onPressed: () {
                    numTasbeh++;
                    TypeOfTasabeh();
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                      maximumSize: Size(150, 50),
                      backgroundColor: ThemData.primryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    "${typeOfTasabeh[index]}",
                    style: TextStyle(fontSize: 20),
                  )),
            ],
          ),
        )
      ],
    );
  }

  void TypeOfTasabeh() {
    for (int i = 0; i < typeOfTasabeh.length; i++) {
      if (numTasbeh == 33) {
        if (index <= 3) {
          index++;
          numTasbeh = 0;
          setState(() {});
          numTasbeh = 0;
        }
        if (index == 3) {
          index = index - 3;
        }
      }
    }
  }
}
