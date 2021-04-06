import 'package:flutter/material.dart';
import 'package:gradeproject/AllWidgets/customappbar.dart';
import 'package:gradeproject/pages/home.dart';
import 'package:page_transition/page_transition.dart';

class garageselect extends StatefulWidget {
  @override
  _garageselectState createState() => _garageselectState();
}

class _garageselectState extends State<garageselect> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool pressAttention=true;

  final List<String> entries = <String>[
    'A1',
    'A2',
    'A3',
    'A4',
    'A5',
    'A6',
    'A7',
    'A8',
    'A9'
  ];
  final List<Color> colordata = <Color>[
    Colors.red,
    Colors.yellow,
    Colors.green
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xff078547),
      appBar: cus_appbar(
          'HTI Garage',
          IconButton(
            onPressed: () {
              Navigator.pop(context,false);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff078547),
            ),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "HTI Garage",
                    style: TextStyle(
                        color: Color(0xff078547),
                        fontFamily: "BackToSchool",
                        fontSize: 17,
                        backgroundColor: Colors.white12),
                  ),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: entries.length,
                      itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:Ink(
                        child: InkWell(
                          child: Container(
                            height: 120,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              border: Border.all(color: Colors.black.withOpacity(0.5),width: pressAttention ? 0 : 8),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onTap: (){
                            setState(() => pressAttention = !pressAttention);
                            print('Tapped');
                          },
                        ),
                      ),
                    );
                  }),

                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Book Now",
                      style: TextStyle(fontFamily: "BackToSchool"),
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Color(0xff078547),
                      onSurface: Colors.yellow,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
