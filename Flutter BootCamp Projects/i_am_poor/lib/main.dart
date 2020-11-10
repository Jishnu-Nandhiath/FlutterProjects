import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    backgroundColor: Colors.red[100],
    appBar: AppBar(
      title: Center(
        child: Text('I Am Poor'),
      ),
      backgroundColor: Colors.redAccent[700],
    ),
    body: Center(
        child: Image(
      image: AssetImage('images/I_am_poor.jpg'),
    )),
  )));
}
