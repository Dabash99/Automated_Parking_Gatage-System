import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_controller/google_maps_controller.dart';
import 'package:gradeproject/AllWidgets/customappbar.dart';
import 'file:///D:/GP/gradeproject/lib/AllWidgets/drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gradeproject/pages/garage_select.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';


// ignore: camel_case_types
class home_map extends StatefulWidget {
  @override
  _home_mapState createState() => _home_mapState();
}

class _home_mapState extends State<home_map> {
  static const String idScreen = "home";


  GoogleMapController mapController;
  List <LatLng> PlinCordinates = [];
  Set <Polyline> polylineset={};
  String searchAddr;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Position currentpostion;
  Completer<GoogleMapController> _controllerGoogle = Completer();
  var gelocator = Geolocator();
  double bottomPaddingofMap= 0;
  static final CameraPosition _keyplex = CameraPosition(
      target: LatLng(30.287265, 31.7406), zoom: 17.0);
  void locatepostion() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentpostion = position;
    LatLng latlatposition = LatLng(position.latitude, position.longitude);
    CameraPosition camera_Position =
        new CameraPosition(target: latlatposition, zoom: 14);
    mapController
        .animateCamera(CameraUpdate.newCameraPosition(camera_Position));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xff078547),
        appBar: cus_appbar("Home", null),
        drawer: custom_drawer_ps(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  height: MediaQuery.of(context).size.height - 300,
                  width: double.infinity,
                  child: Stack(
                    children: <Widget>[
                      GoogleMap(
                        padding: EdgeInsets.only(bottom: bottomPaddingofMap),
                        myLocationButtonEnabled: true,
                        initialCameraPosition: _keyplex ,
                        mapType: MapType.normal,
                        myLocationEnabled: true,
                        zoomControlsEnabled: true,
                        zoomGesturesEnabled: true,
                        onMapCreated: (GoogleMapController controller) {
                          _controllerGoogle.complete(controller);
                          mapController = controller;
                          setState(() {
                            bottomPaddingofMap = 0;
                          });
                          locatepostion();
                        },

                      ),
                    ],
                  )
                ),
              ),
              //******Bottom Container Book Now*************
              Padding(
                padding: EdgeInsets.all(15),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 3.0,
                        spreadRadius: 2.0,
                        offset:
                            Offset(2.0, 5.0), // shadow direction: bottom right
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 15),
                        child: Text(
                          'HTI Garage',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff078547)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 5),
                        child: Text(
                          'Distance between garage : 100 meter',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff078547)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Center(
                          child: FlatButton(
                              color: Color(0xff078547),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      child: garageselect(),
                                    ));
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  side: BorderSide(
                                    color: Color(0xff078547),
                                  )),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                child: Text(
                                  "Book Now",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17,
                                      color: Colors.white),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

// void onMapCreated(controller) {
//   setState(() {
//     mapController = controller;
//   });
// }
}
