import 'package:flutter/material.dart';
import 'price_screen.dart';

void main() => runApp(MyApp());
//add your api key to networking.dart for the code to work.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.white),
      home: PriceScreen(),
    );
  }
}
