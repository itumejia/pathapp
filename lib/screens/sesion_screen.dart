import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pathapp/screens/login_screen.dart';
import 'package:pathapp/screens/register_screen.dart';
import 'package:pathapp/utilities/components/fonts.dart';
import 'package:pathapp/utilities/constants.dart';
import '../utilities/components/diamond.dart';
import '../utilities/components/roundedContainer.dart';

class sesionScreen extends StatelessWidget {
  static String id = 'sesion_screen';
  Container containerTop;
  Container containerBottom;

  @override
  Widget build(BuildContext context) {
    final double widthScreenPercentage = MediaQuery.of(context).size.width;
    final double heightScreenPercentage = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kColorMorado,
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: heightScreenPercentage * 0.05),
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/images/efectosFondo.svg',
                    //La imagen ocupa el 80% de la pantalla
                    width: widthScreenPercentage * 0.85,
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: heightScreenPercentage * 0.15),
                    child: SvgPicture.asset(
                      'assets/images/puertaMorada.svg',
                      width: widthScreenPercentage * 0.20,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: heightScreenPercentage * 0.015),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                      child: roundedContainer(
                        heightPercentage: heightScreenPercentage * 0.06,
                        widthPercentage: widthScreenPercentage * 0.45,
                        childContainer: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            diamond(diamondSize: widthScreenPercentage * 0.05),
                            Container(
                              width: widthScreenPercentage * 0.04,
                            ),
                            fontStyleAmaranth(
                                text: 'ENTRAR',
                                sizePercentage: 2.4,
                                color: Colors.white,
                                letterSpacing: widthScreenPercentage * 0.001),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: heightScreenPercentage * 0.015),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterScreen.id);
                      },
                      child: roundedContainer(
                        heightPercentage: heightScreenPercentage * 0.06,
                        widthPercentage: widthScreenPercentage * 0.45,
                        childContainer: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            fontStyleAmaranth(
                                text: 'REGISTRARSE',
                                sizePercentage: 2.1,
                                color: Colors.white,
                                letterSpacing: widthScreenPercentage * 0.001),
                            Container(
                              width: widthScreenPercentage * 0.04,
                            ),
                            diamond(diamondSize: widthScreenPercentage * 0.05),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
