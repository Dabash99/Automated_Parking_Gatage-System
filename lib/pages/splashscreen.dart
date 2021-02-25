import 'dart:async';

import 'package:flutter/material.dart';

import 'login.dart';

class SC extends StatefulWidget {
  @override
  _SCState createState() => _SCState();
}

class _SCState extends State<SC> {
  static const String idScreen ="sc";

  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF078547).withOpacity(0.65),
        body: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 7,
              ),
              Center(
                child: Image(
                    image: AssetImage(
                      'assets/images/logo_splash.png',
                    ),
                    fit: BoxFit.fitWidth),
              ),
            ],
          ),
        ));
  }
}
