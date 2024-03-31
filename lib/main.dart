import 'package:flutter/material.dart';
import 'package:islameapp/core/home.dart';
import 'package:islameapp/widget_fragment/quran/sura_details.dart';

import 'core/suraWidget/suraDetails.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,)
      ,
      routes: {
        Home.ROUTE_NAME:(context)=>Home(),
        suraDetais.Route_Name:(context)=>suraDetails()

      },
      initialRoute: Home.ROUTE_NAME,
      );}}
