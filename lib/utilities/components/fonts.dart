import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class fontStyleMPlus extends StatelessWidget {
  fontStyleMPlus(
      {@required this.text,
      @required this.sizePercentage,
      @required this.color,
      this.letterSpacing});
  final String text;
  final double sizePercentage;
  final Color color;
  final double letterSpacing;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.mPlusRounded1c(
          color: color,
          fontSize: ResponsiveFlutter.of(context).fontSize(sizePercentage),
          fontWeight: FontWeight.bold,
          letterSpacing: letterSpacing != null ? letterSpacing : 0),
    );
  }
}

class fontStyleAmaranth extends StatelessWidget {
  fontStyleAmaranth(
      {@required this.text,
      @required this.sizePercentage,
      @required this.color,
      this.letterSpacing});
  final String text;
  final double sizePercentage;
  final Color color;
  final double letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.amaranth(
          color: color,
          fontSize: ResponsiveFlutter.of(context).fontSize(sizePercentage),
          fontWeight: FontWeight.bold,
          letterSpacing: letterSpacing != null ? letterSpacing : 0),
    );
  }
}
