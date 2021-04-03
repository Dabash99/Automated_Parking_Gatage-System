import 'package:flutter/material.dart';
import 'package:gradeproject/AllWidgets/ProgressDialog.dart';
import 'package:gradeproject/main.dart';
import 'package:gradeproject/models/register_model.dart';
import 'package:gradeproject/pages/home.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'login.dart';

class sign_up extends StatefulWidget {
  static const String idScreen = "Register";

  @override
  _sign_upState createState() => _sign_upState();
}

Future<UserModelRegister> CreateUser(
    String fname,
    String Lname,
    String Password,
    String email,
    String CarNumber,
    String CarLetter,
    String phone) async {
  final Uri ApiURL =
      'https://graduation-project-apis.herokuapp.com/createUser' as Uri;
  final response = await http.post(ApiURL, body: {
    "firstName": fname,
    "lastName": Lname,
    "email": email,
    "password": Password,
    "phoneNumber": phone,
    "carNumber": CarNumber,
    "carLetter": CarLetter
  });
  if (response.statusCode == 201) {
    final String responseString = response.body;
    return userModelRegisterFromJson(responseString);
  } else {
    return null;
  }
}

class _sign_upState extends State<sign_up> {
  UserModelRegister _User ;
  TextEditingController FnameTEC,
      LnameTEC,
      PasswTEC,
      REPasswTEC,
      EmailTEC,
      CNTEC,
      CLTEC,
      PhoneNTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff078547),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                //logo with Circle
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Image.asset(
                      'assets/images/logo_splash.png',
                      height: 50,
                      width: 50,
                    ),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(150)),
                  ),
                ),
                //SignUP data Container
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                    color: Color(0xff078547),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Flexible(
                                    child: TextField(
                                        controller: FnameTEC,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                            hintText: 'First Name',
                                            prefixStyle: TextStyle(
                                                color: Color(0xff078547)),
                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15,
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: new BorderSide(
                                                    color: Color(0xff078547))),
                                            contentPadding:
                                                EdgeInsets.all(10))),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Flexible(
                                    child: TextField(
                                        controller: LnameTEC,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                            hintText: 'Last Name',
                                            prefixStyle: TextStyle(
                                                color: Color(0xff078547)),
                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15,
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: new BorderSide(
                                                    color: Color(0xff078547))),
                                            contentPadding:
                                                EdgeInsets.all(10))),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            bulidTextField(EmailTEC, 'Email', false,
                                TextInputType.emailAddress, null),
                            SizedBox(
                              height: 20,
                            ),
                            bulidTextField(PasswTEC, 'Password', true,
                                TextInputType.number, 'Only 8 number'),
                            bulidTextField(REPasswTEC, 'Repeat Password', true,
                                TextInputType.number, 'Only 8 number'),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Flexible(
                                    child: TextField(
                                        controller: CNTEC,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            hintText: 'Car Number',
                                            prefixStyle: TextStyle(
                                                color: Color(0xff078547)),
                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15,
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: new BorderSide(
                                                    color: Color(0xff078547))),
                                            contentPadding:
                                                EdgeInsets.all(10))),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Flexible(
                                    child: TextField(
                                        controller: CLTEC,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                            hintText: 'Car Letter',
                                            prefixStyle: TextStyle(
                                                color: Color(0xff078547)),
                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15,
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: new BorderSide(
                                                    color: Color(0xff078547))),
                                            contentPadding:
                                                EdgeInsets.all(10))),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: TextField(
                                  controller: PhoneNTEC,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                      hintText: 'Phone Number',
                                      prefixStyle:
                                          TextStyle(color: Color(0xff078547)),
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: new BorderSide(
                                              color: Color(0xff078547))),
                                      contentPadding: EdgeInsets.all(10))),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 3.0,
                                      spreadRadius: 2.0,
                                      offset: Offset(2.0,
                                          2.0), // shadow direction: bottom right
                                    )
                                  ],
                                  color: Color(0xff078547),
                                  borderRadius: BorderRadius.circular(150)),
                              child: FlatButton(
                                onPressed: () async {

                                  final String firstName = FnameTEC.text;
                                  final String lastName = LnameTEC.text;
                                  final String email = EmailTEC.text;
                                  final String password = PasswTEC.text;
                                  final String phoneNumber = PhoneNTEC.text;
                                  final String carNumber = CNTEC.text;
                                  final String carLetter = CLTEC.text;
                                  final UserModelRegister user =
                                      await CreateUser(
                                          firstName,
                                          lastName,
                                          password,
                                          email,
                                          carNumber,
                                          carLetter,
                                          phoneNumber);
                                  setState(() {
                                    _User =user;
                                  });
                                  displayToastMessage("Congratulation your account has been Created", context);
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.rightToLeftWithFade,
                                      child: home_map(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'have an acount?',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()),
                                    );
                                  },
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                        color: Color(0xff078547),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}

Widget bulidTextField(TextEditingController CController, String hintText,
    bool _isObscure, var typeinput, String helptext) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Flexible(
      child: TextField(
        controller: CController,
        obscureText: _isObscure,
        keyboardType: typeinput,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          helperText: helptext,
          prefixStyle: TextStyle(color: Color(0xff078547)),
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: new BorderSide(color: Color(0xff078547))),
        ),
      ),
    ),
  );
}
