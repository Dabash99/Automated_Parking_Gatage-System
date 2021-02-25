import 'package:flutter/material.dart';
import 'package:gradeproject/AllWidgets/customappbar.dart';
import 'package:gradeproject/pages/help.dart';
import 'package:gradeproject/pages/home.dart';
import 'package:page_transition/page_transition.dart';

class garageselect extends StatefulWidget {
  @override
  _garageselectState createState() => _garageselectState();
}

class _garageselectState extends State<garageselect> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xff078547),
      appBar: cus_appbar(
          'HTI Garage',
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.scale,
                      alignment: Alignment.bottomCenter,
                      child: help()));
            },
            icon: Icon(Icons.arrow_back,color: Color(0xff078547),),
          )),
      body: SingleChildScrollView(
        
      ),
    );
  }
}
