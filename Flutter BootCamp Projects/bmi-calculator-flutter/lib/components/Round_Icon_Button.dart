import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final IconData icon;
  final Function weightUpdater;

  RoundButton({@required this.icon, @required this.weightUpdater});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: weightUpdater,
      elevation: 10,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF272A4D),
      child: Icon(icon),
    );
  }
}
