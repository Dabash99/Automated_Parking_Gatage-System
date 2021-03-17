import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:gradeproject/pages/garage_select.dart';
import 'package:gradeproject/pages/home.dart';
import 'package:gradeproject/pages/login.dart';
import 'package:gradeproject/pages/splashscreen.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
DatabaseReference usersRef =FirebaseDatabase.instance.reference().child("users");


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
