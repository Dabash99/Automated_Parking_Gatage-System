import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gradeproject/AllWidgets/customappbar.dart';
import 'file:///D:/GP/gradeproject/lib/AllWidgets/drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gradeproject/pages/garage_select.dart';
import 'package:page_transition/page_transition.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'dart:math' show cos, sqrt, asin;



// ignore: camel_case_types
class mapviewtest extends StatefulWidget {
  @override
  _mapviewtestState createState() => _mapviewtestState();
}

class _mapviewtestState extends State<mapviewtest> {

  static const String idScreen = "home";
  String mapAPiKey = "AIzaSyC28mzOn8puR988_9M8SUx8_1msrWxjmWU";
  GoogleMapController mapController;
  List <LatLng> PlinCordinates = [];
  Set <Polyline> polylineset={};
  String searchAddr;
  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }
  final startAddressController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Position currentpostion;
  Set<Marker> markers = {};


  Completer<GoogleMapController> _controllerGoogle = Completer();
  var gelocator = Geolocator();
  double bottomPaddingofMap= 0;
  static final CameraPosition _keyplex = CameraPosition(
      target: LatLng(30.287265, 31.7406), zoom: 30.0);
  // Object for PolylinePoints
  PolylinePoints polylinePoints;

// List of coordinates to join
  List<LatLng> polylineCoordinates = [];

// Map storing polylines created by connecting
// two points
  Map<PolylineId, Polyline> polylines = {};

  LatLng DEST_LOCA = LatLng(37.432785, -122.091743);
  LatLng Plex = LatLng(37.419857, -122.078827);
  void destionatiopostion() async {
    Position destposition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentpostion = destposition;
    LatLng DEST_LOCA = LatLng(37.432785, -122.091743);
    /*CameraPosition camera_destPosition =
    new CameraPosition(target: DEST_LOCA, zoom: 14);
    mapController
        .animateCamera(CameraUpdate.newCameraPosition(camera_destPosition));*/
  }
   void locatepostion() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentpostion = position;
    LatLng latlongposition = LatLng(position.latitude, position.longitude);
    CameraPosition camera_Position =
    new CameraPosition(target: latlongposition, zoom: 14);
    mapController
        .animateCamera(CameraUpdate.newCameraPosition(camera_Position));
  }
  // Create the polylines for showing the route between two places

  _createPolylines(Position start, Position destination) async {
    // Initializing PolylinePoints
    polylinePoints = PolylinePoints();

    // Generating the list of coordinates to be used for
    // drawing the polylines
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      mapAPiKey, // Google Maps API Key
      PointLatLng(start.latitude, start.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.transit,
    );

    // Adding the coordinates to the list
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    // Defining an ID
    PolylineId id = PolylineId('poly');

    // Initializing Polyline
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 3,
    );

    // Adding the polyline to the map
    polylines[id] = polyline;
  }
  // Method for retrieving the current location


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
                          polylines: Set<Polyline>.of(polylines.values),
                          padding: EdgeInsets.only(bottom: bottomPaddingofMap),
                          myLocationButtonEnabled: false,
                          initialCameraPosition: _keyplex ,
                          mapType: MapType.normal,
                          myLocationEnabled: true,
                          zoomControlsEnabled: false,
                          zoomGesturesEnabled: true,
                          onMapCreated: (GoogleMapController controller) {
                            _controllerGoogle.complete(controller);
                            mapController = controller;
                            setState(() {
                              bottomPaddingofMap = 0;
                            });
                            locatepostion();
                            destionatiopostion();
                          },
                        ),
                        // Show current location button
                        SafeArea(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: ClipOval(
                                child: Material(
                                  color: Color(0xff078547).withOpacity(0.9), // button color
                                  child: InkWell(
                                    splashColor: Colors.green[100], // inkwell color
                                    child: SizedBox(
                                      width: 56,
                                      height: 56,
                                      child: Icon(Icons.my_location,color:Colors.white),
                                    ),
                                    onTap: () {
                                      mapController.animateCamera(
                                        CameraUpdate.newCameraPosition(
                                          CameraPosition(
                                            target: LatLng(
                                              currentpostion.latitude,
                                              currentpostion.longitude,
                                            ),
                                            zoom: 18.0,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Show zoom buttons
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ClipOval(
                                  child: Material(
                                    color: Color(0xff078547).withOpacity(0.9), // button color
                                    child: InkWell(
                                      splashColor: Colors.green[100], // inkwell color
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: Icon(Icons.add,color: Colors.white,),
                                      ),
                                      onTap: () {
                                        mapController.animateCamera(
                                          CameraUpdate.zoomIn(),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                ClipOval(
                                  child: Material(
                                    color: Color(0xff078547).withOpacity(0.9), // button color
                                    child: InkWell(
                                      splashColor: Colors.green, // inkwell color
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: Icon(Icons.remove,color: Colors.white,),
                                      ),
                                      onTap: () {
                                        mapController.animateCamera(
                                          CameraUpdate.zoomOut(),
                                        );
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
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
                          'HTI Garage',// Garage Name
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

                                /*Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      child: garageselect(),
                                    ));*/
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
}