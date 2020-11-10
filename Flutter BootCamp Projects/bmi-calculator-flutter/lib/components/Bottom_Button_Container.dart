import 'package:flutter/material.dart';
import '../constants.dart';

class BottomContainer extends StatelessWidget {
  final Function onTap;
  final String bottomButtonText;

  BottomContainer({@required this.onTap, @required this.bottomButtonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 15),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
        child:
            Center(child: Text(bottomButtonText, style: kLargeButtonTextStyle)),
      ),
    );
  }
}
