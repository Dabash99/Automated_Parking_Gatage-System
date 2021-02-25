import 'package:flutter/material.dart';
import 'package:gradeproject/pages/help.dart';
import 'package:gradeproject/pages/home.dart';
import 'package:page_transition/page_transition.dart';


// ignore: camel_case_types
class custom_drawer_ps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff036635),
            ),
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/logo_splash.png',
                  width: 80,
                  height: 80,
                ),
                Text(
                  'Park your car',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'ahmeddabash301@gmail.com',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                )
              ],
            ),
          ),
          //Home Tap
          ListTile(
            title: Text(
              'Home',
              style: TextStyle(color: Color(0xff078547)),
            ),
            leading: Icon(
              Icons.home,
              color: Color(0xff078547),
            ),
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: home_map(),
                ),
              );
            },
          ),
          //Edit Tap
          /*ListTile(
            title: Text('Edit Your Account ',style: TextStyle(color:  Color(0xff078547)),),
            leading: Icon(Icons.edit,color:Color(0xff078547),),
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: edit(),
                ),
              );
            },
          ),*/
          //Help Tap
          ListTile(
            title: Text(
              'Help',
              style: TextStyle(color: Color(0xff078547)),
            ),
            leading: Icon(
              Icons.help,
              color: Color(0xff078547),
            ),
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: help(),
                ),
              );
            },
          ),
          //Share Tap
          ListTile(
            title: Text(
              'Share',
              style: TextStyle(color: Color(0xff078547)),
            ),
            leading: Icon(
              Icons.share,
              color: Color(0xff078547),
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          //Rate Tap
          ListTile(
            title: Text(
              'Rate Us',
              style: TextStyle(color: Color(0xff078547)),
            ),
            leading: Icon(Icons.rate_review, color: Color(0xff078547)),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
