import 'package:flutter/material.dart';
import 'package:pathapp/utilities/constants.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({@required this.titleText, this.colorProperty, this.onPressedFunction});
  final colorProperty;
  final titleText;
  final onPressedFunction;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      padding: EdgeInsets.all(10.0),
      child: Material(
        elevation: 5.0,
        color: colorProperty,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressedFunction,
          minWidth: 120.0,
          height: 2.0,
          child: Text(
            titleText,
            style: TextStyle(
              color: kColorMorado,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}