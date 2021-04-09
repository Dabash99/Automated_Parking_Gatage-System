import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';

Future<Widget> myAlertDialog(BuildContext context) {
  return CoolAlert.show(
    context: context,
    type: CoolAlertType.error,
    title: "Your reservation canceled ",
    text: "The car was not parked and the reservation was canceled"
  );
}
