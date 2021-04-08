import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';


class CDownTimer extends StatefulWidget {
  final String title='';

  @override
  _CDownTimerState createState() => _CDownTimerState();
}

class _CDownTimerState extends State<CDownTimer> {
  CountDownController _controller = CountDownController();
  int _duration = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: CircularCountDownTimer(
            duration: 10,
            initialDuration: 0,
            controller: CountDownController(),
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 2,
            ringColor: Colors.grey[300],
            ringGradient: null,
            fillColor: Colors.purpleAccent[100],
            fillGradient: null,
            backgroundColor: Colors.purple[500],
            backgroundGradient: null,
            strokeWidth: 20.0,
            strokeCap: StrokeCap.round,
            textStyle: TextStyle(
                fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),
            textFormat: CountdownTextFormat.S,
            isReverse: false,
            isReverseAnimation: false,
            isTimerTextShown: true,
            autoStart: false,
            onStart: () {
              print('Countdown Started');
            },
            onComplete: () {
              print('Countdown Ended');
            },
          )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 30,
          ),
          _button(title: "Start", onPressed: () => _controller.start()),
          SizedBox(
            width: 10,
          ),
          _button(title: "Pause", onPressed: () => _controller.pause()),
          SizedBox(
            width: 10,
          ),
          _button(title: "Resume", onPressed: () => _controller.resume()),
          SizedBox(
            width: 10,
          ),
          _button(
              title: "Restart",
              onPressed: () => _controller.restart(duration: _duration))
        ],
      ),
    );
  }

  _button({@required String title, VoidCallback onPressed}) {
    return Expanded(
        child: RaisedButton(
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          onPressed: onPressed,
          color: Colors.purple,
        ));
  }
}
