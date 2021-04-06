import 'package:flutter/material.dart';

class cus_appbar extends StatelessWidget with PreferredSizeWidget {
  @override
  final String title;
  final Size preferredSize;
  final bool centerTitle = true;
  final Widget Leading;
  cus_appbar(@required this.title,@required this.Leading, {Key key})
      : preferredSize = Size.fromHeight(60.0),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Color(0xff078547)
      ),
      brightness:Brightness.dark,
      leading: Leading,
      title: Center(
          child: Row(
            children: <Widget>[
              Image.asset(
                'assets/images/logo_splash.png',
                height: 50,
                width: 50,
              ),
              Text(
                title,
                style:
                TextStyle(color: Color(0xff078547), fontSize: 17),
              ),
            ],
          ),
      ),
      actions: <Widget>[
        Image.asset('assets/images/w.png',height: 100,width: 100,)
      ],
    );
  }
}
