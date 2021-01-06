import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pathapp/utilities/components/diamond.dart';

class introScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfb609fb3),
      body: Stack(
        children: [
          Center(
            heightFactor: 1.5,
            child: SvgPicture.asset(
              'assets/images/efectosFondo.svg',
              width: MediaQuery.of(context).size.width * 0.80,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(
              'assets/images/camino.svg',
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Text(
                      'You gotta start somewhere...',
                      style: GoogleFonts.amaranth(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    'PATH',
                    style: GoogleFonts.mPlusRounded1c(
                        color: Colors.white,
                        fontSize: 65.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.60,
                    height: 1.0,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 45),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
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
                      child: Center(
                        child: createDiamond(22),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 50),
                    child: SvgPicture.asset(
                      'assets/images/puertaAzul.svg',
                      width: MediaQuery.of(context).size.width * 0.13,
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
