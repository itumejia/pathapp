import 'package:flutter/material.dart';
import 'package:pathapp/utilities/constants.dart';
import 'package:pathapp/utilities/components/fonts.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {@required this.titleText,
      this.colorProperty,
      this.onPressedFunction,
      @required this.screenHeight});
  final double screenHeight;
  final Color colorProperty;
  final String titleText;
  final Function onPressedFunction;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.065,
      padding: EdgeInsets.all(screenHeight * 0.016),
      child: Material(
        elevation: screenHeight * 0.02,
        color: colorProperty,
        borderRadius: BorderRadius.circular(screenHeight * 0.1),
        child: MaterialButton(
          onPressed: onPressedFunction,
          minWidth: screenHeight * 0.2,
          child: fontStyleAmaranth(
            text: titleText,
            sizePercentage: 1.6,
            color: kColorMorado,
            letterSpacing: screenHeight * 0.0005,
          ),
        ),
      ),
    );
  }
}
