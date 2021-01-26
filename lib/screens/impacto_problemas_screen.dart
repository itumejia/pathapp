import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utilities/components/diamond.dart';
import '../utilities/components/roundedContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:pathapp/utilities/components/fonts.dart';
import 'package:pathapp/utilities/constants.dart';
import 'package:pathapp/screens/Secciones.dart';
import 'package:pathapp/screens/problemas_del_mundo.dart';

class impactoProblemas extends StatefulWidget {
  static String id = 'impacto_problemas_screen';
  @override
  _impactoProblemasState createState() => _impactoProblemasState();
}

class _impactoProblemasState extends State<impactoProblemas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorAzulClaro,
      body: SafeArea(
        child: Stack(),
      ),
    );
  }
}
