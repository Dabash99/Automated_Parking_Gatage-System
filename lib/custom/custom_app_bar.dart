import 'package:flutter/material.dart';

class CustomAppBar extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path =Path();
    path.lineTo(0, size.height - 90);
    path.quadraticBezierTo(
        size.width / 2, size.height,
        size.width, size.height - 90
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw false;
  }

}

class HeaderCurvedContainer extends CustomPainter{
  @override
  void paint(Canvas canvas,Size size){
    Paint paint= Paint()..color=Colors.white;
    Path path =Path()
      ..relativeLineTo(0, 50)
      ..quadraticBezierTo(size.width/2, 190, size.width, 50)
      ..relativeLineTo(0,-150)
      ..close();
    canvas.drawPath(path, paint);
  }
  @override
  bool  shouldRepaint( CustomPainter oldDelegate) => false;
}

