import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Pantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color(0xfb272B3E),
      body: Column(
        children: [
          Container(
            width: 420,
            height: 683,
            child: Stack(
              children: [
                Positioned(
                  bottom: 545,
                  right: 1,
                  child: Container(
                    width: 370.0,
                    height: 50.0,
                    child: Center(
                      child: Text(
                        'A Ñ A D E  1  P R O B L E M A',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: 'Amaranth',
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 545,
                  right: 32,
                  child: Container(
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 557,
                  right: 335,
                  child: Container(
                    child: Transform.rotate(
                      angle: pi / 4,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 10.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 605,
                  right: 340,
                  child: RawMaterialButton(
                    onPressed: () {},
                    fillColor: Colors.white,
                    child: Icon(
                      Icons.arrow_back,
                      size: 25.0,
                    ),
                    padding: EdgeInsets.all(8.0),
                    shape: CircleBorder(),
                  ),
                ),
                Positioned(
                  bottom: 240,
                  right: 10,
                  child: SvgPicture.asset('images/Efectos-Fondo.svg'),
                ),
                Positioned(
                  bottom: 40,
                  right: 80,
                  child: SvgPicture.asset('images/Blocnotas.svg'),
                ),
                Positioned(
                  bottom: 340,
                  right: 100,
                  child: Image(
                    image: AssetImage('images/Mundo.png'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
