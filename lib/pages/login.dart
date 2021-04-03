
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gradeproject/AllWidgets/ProgressDialog.dart';
import 'package:gradeproject/main.dart';
import 'package:gradeproject/pages/sign_up.dart';
import 'package:page_transition/page_transition.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static const String idScreen ="login";

  TextEditingController EmailTEC = TextEditingController() ;
  TextEditingController PasswTEC = TextEditingController() ;
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
                  padding: EdgeInsets.only(top: 100,bottom: 0,right: 10,left: 10),
                  child: Container(
                    width: double.infinity,
                    // height: 400,
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
                        Column(
                          children: <Widget>[
                            bulidTextField(EmailTEC,'Email', false,
                                TextInputType.emailAddress, null),
                            SizedBox(
                              height: 20,
                            ),
                            bulidTextField(PasswTEC,'Password', true,
                                TextInputType.number, 'Only 8 number'),
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
                                onPressed: () {
                                  if(PasswTEC.text.isEmpty || EmailTEC.text.isEmpty){
                                    displayToastMessage("Please fill form to log in", context);
                                  }
                                  else if(!EmailTEC.text.contains("@")){
                                    displayToastMessage("Email address not Valid",context);
                                  }
                                  else{
                                  }
                                },
                                child: Text(
                                  'Sign in',
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
                                  'Don\'t have an account?',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => sign_up()),
                                    );
                                  },
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(
                                        color: Color(0xff078547),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17
                                    ),
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
  displayToastMessage (String message , BuildContext context){
    Fluttertoast.showToast(msg: message);
  }
}

Widget bulidTextField( TextEditingController controller,
    String hintText, bool _isObscure, var typeinput, String helptext) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: TextField(
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
            borderSide:  BorderSide(color: Color(0xff078547))),
        prefixIcon: hintText == 'Email' ? Icon(Icons.email) : Icon(Icons.lock),
      ),
    ),
  );
}

void setState(Null Function() param0) {}