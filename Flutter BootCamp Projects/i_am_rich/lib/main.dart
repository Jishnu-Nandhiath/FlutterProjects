import 'package:flutter/material.dart';

// the main function is starting point for all our flutter apps
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
              title: Center(child: Text('I am Rich')),
              backgroundColor: Colors.blueGrey[900]),
          body: Center(
            child: Image(
              image: AssetImage('Images/diamond.png'),
            ),
          )),
    ),
  );
}
