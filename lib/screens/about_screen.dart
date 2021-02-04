import 'package:flutter/material.dart';
import 'package:pathapp/utilities/components/fonts.dart';
import 'package:pathapp/utilities/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:pathapp/screens/Secciones.dart';
import 'package:pathapp/utilities/components/backButton.dart';

class aboutScreen extends StatelessWidget {
  static String id = 'about_screen';
  final String titulo;
  final String cuerpo;

  aboutScreen({this.titulo,this.cuerpo});

  @override
  Widget build(BuildContext context) {
    final double widthScreenPercentage = MediaQuery.of(context).size.width;
    final double heightScreenPercentage = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kColorMorado,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: heightScreenPercentage * 0.06),
            child: SvgPicture.asset(
              'assets/images/efectosFondo2.svg',
              //La imagen ocupa el 80% de la pantalla
              width: widthScreenPercentage,
            ),
          ),
          backButton(
              on_pressed: () {
                Navigator.pop(context);
              },
              screenWidth: widthScreenPercentage),
          SafeArea(
            child: Center(
              child: Container(
                width: widthScreenPercentage * 0.75,
                height: heightScreenPercentage * 0.7,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(widthScreenPercentage * 0.06),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: heightScreenPercentage * 0.035),
                      child: fontStyleMPlus(
                          text: titulo,
                          sizePercentage: 3.5,
                          color: kColorAzulMarino),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: heightScreenPercentage * 0.025),
                      child: Container(
                        width: widthScreenPercentage * 0.4,
                        height: heightScreenPercentage * 0.002,
                        color: kColorAzulMarino,
                      ),
                    ),
                    Container(
                      width: widthScreenPercentage * 0.65,
                      height: heightScreenPercentage * 0.52,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: kColorAzulMarino,
                          width: widthScreenPercentage * 0.003,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(widthScreenPercentage * 0.05),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(widthScreenPercentage * 0.045),
                        child: fontStyleMPlus(
                            text: cuerpo,
                            sizePercentage: 2,
                            textAlign: TextAlign.justify,
                            color: kColorAzulMarino),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
