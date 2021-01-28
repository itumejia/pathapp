import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utilities/components/count_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:pathapp/utilities/components/fonts.dart';
import 'package:pathapp/utilities/constants.dart';
import 'package:pathapp/screens/Secciones.dart';
import 'package:pathapp/screens/problemas_del_mundo.dart';
import 'package:pathapp/utilities/components/backButton.dart';
import 'package:pathapp/utilities/components/rating_row.dart';

class impactoProblemas extends StatefulWidget {
  static String id = 'impacto_problemas_screen';
  @override
  _impactoProblemasState createState() => _impactoProblemasState();
}

class _impactoProblemasState extends State<impactoProblemas> {
  @override
  Widget build(BuildContext context) {
    double impacto1;
    final double widthScreenPercentage = MediaQuery.of(context).size.width;
    final double heightScreenPercentage = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kColorAzulClaro,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: heightScreenPercentage * 0.01),
              child: SvgPicture.asset(
                'assets/images/headerImpacto.svg',
                //La imagen ocupa el 80% de la pantalla
                width: widthScreenPercentage,
              ),
            ),
            backButton(
                on_pressed: () {
                  Navigator.pushReplacementNamed(context, problemasMundo.id);
                },
                screenWidth: widthScreenPercentage),
            Padding(
              padding: EdgeInsets.only(
                  top: heightScreenPercentage * 0.81,
                  left: widthScreenPercentage * 0.85),
              child: Container(
                child: RawMaterialButton(
                  elevation: 10,
                  onPressed: () {}, //TODO: Crear el about de la screen
                  fillColor: Colors.white,
                  child: Icon(
                    Icons.help_outline_sharp,
                    color: Colors.black,
                  ),
                  shape: CircleBorder(),
                ),
                width: widthScreenPercentage * 0.1,
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: heightScreenPercentage * 0.14),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/images/efectosFondo.svg',
                      //La imagen ocupa el 80% de la pantalla
                      width: widthScreenPercentage * 0.90,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: heightScreenPercentage * 0.21),
                    child: Container(
                      width: widthScreenPercentage * 0.7,
                      height: heightScreenPercentage * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight:
                                Radius.circular(widthScreenPercentage * 0.13),
                            bottomLeft:
                                Radius.circular(widthScreenPercentage * 0.13)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: heightScreenPercentage * 0.015),
                            child: fontStyleMPlus(
                                text: "PROBLEMAS #1",
                                sizePercentage: 3,
                                color: Colors.black),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: heightScreenPercentage * 0.025),
                            child: Container(
                                width: widthScreenPercentage * 0.4,
                                height: heightScreenPercentage * 0.0015,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: heightScreenPercentage * 0.07),
                    child: CountButton(
                      screenWidth: widthScreenPercentage,
                      screenHeight: heightScreenPercentage,
                      text: 'CONTINUAR',
                      color: kColorBlancoOpaco,
                      fontcolor: kColorUniverso,
                      function: () async {
                        setState(() {
                          Navigator.pushReplacementNamed(
                              context, impactoProblemas.id);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
