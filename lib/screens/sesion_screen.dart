import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utilities/components/diamond.dart';

class sesionScreen extends StatelessWidget {
  Widget createRect(
      BuildContext context, Widget leftWidget, Widget rightWidget) {
    return (Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 1.0,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          leftWidget,
          Container(
            width: MediaQuery.of(context).size.width * 0.04,
          ),
          rightWidget,
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfb493d73),
      body: Stack(
        children: [
          Center(
            heightFactor: 1.5,
            child: SvgPicture.asset(
              'assets/images/efectosFondo.svg',
              width: MediaQuery.of(context).size.width * 0.80,
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 110.0),
                    child: SvgPicture.asset(
                      'assets/images/puertaMorada.svg',
                      width: MediaQuery.of(context).size.width * 0.20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: InkWell(
                      onTap: () => null,
                      child: createRect(
                        context,
                        createDiamond(22),
                        Text(
                          'ENTRAR',
                          style: GoogleFonts.amaranth(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: InkWell(
                      onTap: () => null,
                      child: createRect(
                        context,
                        Text(
                          'REGISTRARSE',
                          style: GoogleFonts.amaranth(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.0),
                        ),
                        createDiamond(22),
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
