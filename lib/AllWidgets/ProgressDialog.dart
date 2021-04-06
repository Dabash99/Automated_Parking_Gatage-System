import 'package:flutter/material.dart';

class progressDialog extends StatelessWidget {
  String message;
  progressDialog(this.message);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xff0078547).withOpacity(0.7),
      child: Container(
        margin: EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff0078547).withOpacity(0.7),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children:<Widget> [
              SizedBox(width: 6,),
              CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color(0xff078547)),),
              SizedBox(width: 26,),
              Text(message,
                style: TextStyle(
                    color: Color(0xff078547)
                ),)
            ],
          ),
        )
      ),
    );
  }
}
