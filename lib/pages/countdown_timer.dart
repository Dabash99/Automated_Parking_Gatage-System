import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:gradeproject/AllWidgets/AlertDialog.dart';
import 'package:gradeproject/AllWidgets/Alert_Dialog.dart';



class CDownTimer extends StatefulWidget {
  final String title='';

  @override
  _CDownTimerState createState() => _CDownTimerState();
}

class _CDownTimerState extends State<CDownTimer> {

  CountDownController _controller = CountDownController();
  bool _isPause = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer'),
        centerTitle: true,
      ),
      body: Center(
        child: CircularCountDownTimer(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
          duration: 4,
          fillColor: Colors.amber,
          //color: Colors.white,
          controller: _controller,
          backgroundColor: Colors.white54,
          strokeWidth: 10.0,
          strokeCap: StrokeCap.round,
          isTimerTextShown: true,
          isReverse: false,
          onComplete: (){
           myAlertDialog(context);
            //showDialog(context: context, builder: (_) => my_Alert_Dialog());

            /*Alert(
                context: context,
                title: 'Done',
                style: AlertStyle(
                  isCloseButton: true,
                  isButtonVisible: false,
                  titleStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
                type: AlertType.success
            ).show();*/
          },
          textStyle: TextStyle(fontSize: 50.0,color: Colors.black), ringColor: Color(0xFF078547),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          setState(() {
            if(_isPause){
              _isPause = false;
              _controller.resume();
            }else{
              _isPause = true;
              _controller.pause();
            }
          });
        },
        icon: Icon(_isPause ? Icons.play_arrow : Icons.pause),
        label: Text(_isPause ? 'Resume' : 'Pause'),
      ),
    );
  }
}