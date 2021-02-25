import 'package:flutter/material.dart';
import 'package:gradeproject/AllWidgets/ProgressDialog.dart';
import 'package:gradeproject/main.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'home.dart';
import 'login.dart';

// ignore: camel_case_types
class sign_up extends StatelessWidget {
  static const String idScreen ="Register";

  TextEditingController FnameTEC = TextEditingController() ;
  TextEditingController LnameTEC = TextEditingController() ;
  TextEditingController PasswTEC = TextEditingController() ;
  TextEditingController REPasswTEC = TextEditingController() ;
  TextEditingController EmailTEC = TextEditingController() ;
  TextEditingController CNTEC = TextEditingController() ;
  TextEditingController CLTEC = TextEditingController() ;
  TextEditingController PhoneNTEC = TextEditingController() ;
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
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Flexible(
                                    child: TextField(
                                      controller: FnameTEC,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                            hintText: 'First Name',
                                            prefixStyle: TextStyle(color: Color(0xff078547)),
                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15,
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: new BorderSide(color: Color(0xff078547))),
                                            contentPadding: EdgeInsets.all(10)
                                        )
                                    ),
                                  ),
                                  SizedBox(width: 15,),
                                  Flexible(
                                    child: TextField(
                                      controller: LnameTEC,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                            hintText: 'Last Name',
                                            prefixStyle: TextStyle(color: Color(0xff078547)),
                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15,
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: new BorderSide(color: Color(0xff078547))),
                                            contentPadding: EdgeInsets.all(10)
                                        )
                                    ),
                                  )
                                ],),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            bulidTextField(EmailTEC,
                                'Email', false,
                                TextInputType.emailAddress, null),
                            SizedBox(
                              height: 20,
                            ),
                            bulidTextField(PasswTEC,'Password', true,
                                TextInputType.number, 'Only 8 number'),
                            bulidTextField(REPasswTEC,'Repeat Password', true,
                                TextInputType.number, 'Only 8 number'),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Flexible(
                                    child: TextField(
                                      controller: CNTEC,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            hintText: 'Car Number',
                                            prefixStyle: TextStyle(color: Color(0xff078547)),
                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15,
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: new BorderSide(color: Color(0xff078547))),
                                            contentPadding: EdgeInsets.all(10)
                                        )
                                    ),
                                  ),
                                  SizedBox(width: 15,),
                                  Flexible(
                                    child: TextField(
                                      controller: CLTEC,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                            hintText: 'Car Letter',
                                            prefixStyle: TextStyle(color: Color(0xff078547)),
                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15,
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: new BorderSide(color: Color(0xff078547))),
                                            contentPadding: EdgeInsets.all(10)
                                        )
                                    ),
                                  )
                                ],),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: TextField(
                                controller: PhoneNTEC,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                      hintText: 'Phone Number',
                                      prefixStyle: TextStyle(color: Color(0xff078547)),
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: new BorderSide(color: Color(0xff078547))),
                                      contentPadding: EdgeInsets.all(10)
                                  )
                              ),
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
                                onPressed: () {
                                  if(PasswTEC.text.length <8){
                                    displayToastMessage("Password must be atleast 8 Characters",context);
                                  }
                                  else if(CNTEC.text.length >=4 && CNTEC.text.length <=2){
                                    displayToastMessage("Car Number must be atleast 2 Numbers",context);
                                  }
                                  else if(CLTEC.text.length >=4 && CLTEC.text.length <=2){
                                    displayToastMessage("Car Letter must be atleast 2 Numbers",context);
                                  }
                                  else if(!EmailTEC.text.contains("@")){
                                    displayToastMessage("Email address not Valid",context);
                                  }
                                  else if(PhoneNTEC.text.isEmpty || PhoneNTEC.text.length<11)
                                  {
                                    displayToastMessage("Phone number is mandatory", context);
                                  }
                                  else {
                                    regiesterNewUser (context);
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
                                      fontSize: 14
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Login()),
                                    );
                                  },
                                  child: Text(
                                    'Sign In',
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
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void regiesterNewUser (BuildContext context) async {
    showDialog(context: context,barrierDismissible: false,builder: (BuildContext context){
      return progressdialog("Please Wait....");
    });
    final User firebaseUser= (
        await _firebaseAuth.createUserWithEmailAndPassword(email: EmailTEC.text,
            password: PasswTEC.text).catchError((errMsg){
              displayToastMessage("Error: "+ errMsg.toString(), context); 
        })).user;

    if (firebaseUser != null) //User Created
    {
      // Save info to Data base
      Map userDataMap={
        "first name":FnameTEC.text.trim(),
        "last name":LnameTEC.text.trim(),
        "email":EmailTEC.text.trim(),
        "car number":CNTEC.text.trim(),
        "car letter":CLTEC.text.trim(),
        "phone":PhoneNTEC.text.trim(),
        "Password":PasswTEC.text.trim(),
      };
      usersRef.child(firebaseUser.uid).set(userDataMap);
      displayToastMessage("Congratulation your account has been Created", context);
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeftWithFade,
          child: home_map(),
        ),
      );
    }
    else{
      Navigator.pop(context);

      //Error Message
      displayToastMessage("New User account didn\'t Create", context);
    }
  }
}

Widget bulidTextField(
    TextEditingController CController,
    String hintText, bool _isObscure, var typeinput, String helptext) {
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
