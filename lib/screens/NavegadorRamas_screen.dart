import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pathapp/screens/prestigio_screen.dart';
import 'package:pathapp/screens/versatilidad_screen.dart';
import 'package:pathapp/screens/Secciones.dart';
import 'package:pathapp/utilities/components/fonts.dart';
import 'package:pathapp/utilities/components/backButton.dart';
import 'package:pathapp/utilities/constants.dart';
import 'package:pathapp/utilities/components/RoundedButton.dart';

class NavegadorRamas_screen extends StatelessWidget {
  NavegadorRamas_screen({this.carreras});

  final List<dynamic> carreras;
  static String id = 'nav_ramas_screen';

  @override
  Widget build(BuildContext context) {
    final double widthScreenPercentage = MediaQuery.of(context).size.width;
    final double heightScreenPercentage = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: widthScreenPercentage,
        height: heightScreenPercentage,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/desiertoFondo.png"),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Stack(children: [
            backButton(
                on_pressed: () {
                  Navigator.pushReplacementNamed(context, SeccionesScreen.id);
                },
                screenWidth: widthScreenPercentage),
            Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(top: heightScreenPercentage * 0.25),
                    child: fontStyleMPlus(
                      text: "Elige un test",
                      sizePercentage: 6,
                      color: kColorBlancoOpaco,
                      letterSpacing: widthScreenPercentage * 0.007,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: heightScreenPercentage * 0.07),
                    child: RoundedButtonAmatic(
                      titleText: "Versatilidad",
                      screenHeight: heightScreenPercentage * 1.2,
                      colorProperty: kColorBlancoOpaco,
                      //TODO: TestCompleto? kColorGrisCards.withOpacity(0.75): kColorBlancoOpaco
                      widthHeight: widthScreenPercentage * 1.2,
                      textSize: 3.7,
                      onPressedFunction: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => versatilidadScreen(
                              carreras: carreras,
                              versatilidad: true,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  RoundedButtonAmatic(
                    titleText: "Prestigio",
                    screenHeight: heightScreenPercentage * 1.2,
                    colorProperty: kColorBlancoOpaco,
                    //TODO: TestCompleto? kColorGrisCards.withOpacity(0.75): kColorBlancoOpaco
                    widthHeight: widthScreenPercentage * 1.2,
                    textSize: 3.7,
                    onPressedFunction: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => versatilidadScreen(
                            carreras: carreras,
                            versatilidad: false,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
