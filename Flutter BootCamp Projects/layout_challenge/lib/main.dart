import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.blueGrey[700],
            body: Container(
              child: SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  verticalDirection: VerticalDirection.up,
                  children: <Widget>[
                    Container(
                      width: 100,
                      color: Colors.red,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 100,
                            height: 100,
                            color: Colors.yellow,
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            color: Colors.green,
                          )
                        ]),
                    Container(
                      width: 100,
                      color: Colors.blue,
                    ),
                    //SizedBox(width: 100, height: 100)
                  ],
                ),
              ),
            )));
  }
}
