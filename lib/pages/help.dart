import 'package:flutter/material.dart';
import 'package:gradeproject/custom/custom_app_bar.dart';
import 'file:///D:/GP/gradeproject/lib/AllWidgets/drawer.dart';


// ignore: camel_case_types
class help extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xff078547),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBar(
          title: Padding(
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo_splash.png',
                    height: 50,
                    width: 50,
                  ),
                  Text(
                    'Help',
                    style: TextStyle(color: Color(0xff078547), fontSize: 17),
                  )
                ],
              )),
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: ClipPath(
            clipper: CustomAppBar(),
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
            ),
          ),
          leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Color(0xff078547),
              ),
              onPressed: () => _scaffoldKey.currentState.openDrawer()),
        ),
      ),
      drawer: custom_drawer_ps(),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(17.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.help, color: Color(0xff078547)),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          'How to use our App?',
                          style: TextStyle(
                              color: Color(0xff078547),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
