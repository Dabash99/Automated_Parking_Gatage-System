import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gradeproject/AllWidgets/ProgressDialog.dart';
import 'package:gradeproject/api/apiservice.dart';
import 'package:gradeproject/main.dart';
import 'package:gradeproject/models/login_model.dart';
import 'package:gradeproject/pages/sign_up.dart';
import 'dart:convert';

import 'package:page_transition/page_transition.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginRequestModel requestModel;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    requestModel = new LoginRequestModel();
  }

  TextEditingController EmailTEC, PasswTEC = TextEditingController();

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
                //Login data Container
                Padding(
                  padding:
                      EdgeInsets.only(top: 100, bottom: 0, right: 10, left: 10),
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
                                'Sign in',
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
                              bulidTextField(
                                  EmailTEC,
                                  'Email',
                                  false,
                                  TextInputType.emailAddress,
                                  null,
                                  (input) => requestModel.email = input),
                              SizedBox(
                                height: 20,
                              ),
                              bulidTextField(
                                  PasswTEC,
                                  'Password',
                                  true,
                                  TextInputType.number,
                                  'Only 8 number',
                                  (input) => requestModel.password = input),
                              SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (vaildateAndSave()) {
                                    print(requestModel.toJson());
                                    setState(() {
                                      isApiCallProcess = true;
                                    });
                                    APIService apiService = new APIService();
                                    apiService
                                        .login(requestModel)
                                        .then((value) {
                                      if (value != null) {
                                        setState(() {
                                          isApiCallProcess = false;
                                        });
                                      }
                                    });
                                  }
                                },
                                child: Container(
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Center(
                                      child: Text(
                                        'Sign in',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17),
                                      ),
                                    ),
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
                                    'Don\'t have an account?',
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
                                            builder: (context) => sign_up()),
                                      );
                                    },
                                    child: Text(
                                      'Sign up',
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

  displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
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

Widget bulidTextField(TextEditingController controller, String hintText,
    bool _isObscure, var typeinput, String helptext, Function onsaved) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: TextFormField(
      onSaved: onsaved,
      controller: controller,
      obscureText: _isObscure,
      keyboardType: typeinput,
      decoration: InputDecoration(
        hintText: hintText,
        helperText: helptext,
        prefixStyle: TextStyle(color: Color(0xff078547)),
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 15,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xff078547))),
        prefixIcon: hintText == 'Email' ? Icon(Icons.email) : Icon(Icons.lock),
      ),
    ),
  );
}
