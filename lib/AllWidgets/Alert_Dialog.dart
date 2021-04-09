import 'package:flutter/cupertino.dart';
import 'package:custom_dialog/custom_dialog.dart';
import 'package:flutter/material.dart';

Widget my_Alert_Dialog() {
  return CustomDialog(
      content: Text(
        'Your reservation canceled',
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 20.0,
        ),
      ),
      title: Text('Reservation'),
      firstColor: Colors.red,
      secondColor: Colors.white,
      headerIcon: Icon(
        Icons.error_outline_outlined,
        size: 120.0,
        color: Colors.white,
      ));
}
