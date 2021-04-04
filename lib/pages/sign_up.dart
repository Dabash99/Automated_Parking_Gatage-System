import 'package:flutter/material.dart';
import 'package:gradeproject/AllWidgets/ProgressDialog.dart';
import 'package:gradeproject/main.dart';
import 'package:gradeproject/models/Register_model.dart';

import 'package:gradeproject/pages/home.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'login.dart';
import 'package:gradeproject/api/apiservice.dart';


class sign_up extends StatefulWidget {
  static const String idScreen = "Register";

  @override
  _sign_upState createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {
  RegisterRequestModel Register;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    Register = new RegisterRequestModel();
  }

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
                        Form(
                          key: globalFormKey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      child: TextFormField(
                                          onSaved: (input)=> Register.firstName=input,
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
                                      child: TextFormField(
                                          onSaved: (input)=> Register.lastName=input,

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
                                  TextInputType.emailAddress, null, (input) => Register.email =input),
                              SizedBox(
                                height: 20,
                              ),
                              bulidTextField(PasswTEC, 'Password', true,
                                  TextInputType.number, 'Only 8 number',(input)=> Register.password=input),
                              bulidTextField(REPasswTEC, 'Repeat Password', true,
                                  TextInputType.number, 'Only 8 number',null),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      child: TextFormField(
                                        onSaved: (input)=> Register.carNumber=input,
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
                                      child: TextFormField(
                                          onSaved: (input)=> Register.carLetter=input,

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
                                child: TextFormField(
                                    onSaved: (input)=> Register.phoneNumber=input,

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
                                    if (vaildateAndSave()) {
                                      print(Register.toJson());
                                      setState(() {
                                        isApiCallProcess = true;
                                      });
                                      APIService apiService = new APIService();
                                      apiService
                                          .Request(Register)
                                          .then((value) {
                                        if (value != null) {
                                          setState(() {
                                            isApiCallProcess = false;
                                          });
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType
                                                  .rightToLeftWithFade,
                                              child: home_map(),
                                            ),
                                          );
                                        }
                                      });
                                    }

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
                          ),
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
  bool vaildateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
  displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }


Widget bulidTextField(TextEditingController CController, String hintText,
    bool _isObscure, var typeinput, String helptext,Function onsaved) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Flexible(
      child: TextFormField(
        onSaved: onsaved,
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
