import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(Ballpage());
}

class Ballstate extends StatefulWidget {
  @override
  _BallstateState createState() => _BallstateState();
}

class _BallstateState extends State<Ballstate> {
  int ballNumber = 1;
  void randomball() {
    ballNumber = Random().nextInt(5) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.blue,
            child: Center(
              child: FlatButton(
                child: Image.asset('images/ball$ballNumber.png'),
                onPressed: () {
                  setState(() {
                    randomball();
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Ballpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          title: Center(child: Text('Ask Me Anything')),
        ),
        body: Ballstate(),
      ),
    );
  }
}
