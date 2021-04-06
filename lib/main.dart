
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradeproject/pages/garage_select.dart';
import 'package:gradeproject/pages/home.dart';

import 'package:gradeproject/pages/splashscreen.dart';


void main()async {

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'ParkinGrid',
      theme: ThemeData(
        primaryColor:Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: home_map(),
    );
  }
}
