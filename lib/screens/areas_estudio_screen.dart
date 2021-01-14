import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pathapp/utilities/constants.dart';
import '../utilities/components/diamond.dart';

class areasEstudioScreen extends StatefulWidget {
  static String id='areas_estudio_screen';

  @override
  _areasEstudioScreenState createState() => _areasEstudioScreenState();
}

class _areasEstudioScreenState extends State<areasEstudioScreen> {
  String carrera;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfb493d73),
      body: ListView(shrinkWrap: true, children: [
        Stack(
          children: [
            SvgPicture.asset(
              'assets/images/fondoCarrera.svg',
              width: MediaQuery.of(context).size.width,
            ),
            SafeArea(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.65,
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: ListView.builder(
                        itemCount: 4,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  carrera = value;
                                },
                                decoration: kInputCarreras,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: InkWell(
                        onTap: () => null,
                        child: kCreateRect(
                          context,
                          createDiamond(22),
                          Text(
                            'CONTINUAR',
                            style: GoogleFonts.amaranth(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 3.0),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            '\nAGREGA TUS\nCARRERAS',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.amaranth(
                                color: Colors.white,
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 3.0),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                              width: MediaQuery.of(context).size.width * .5,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: RawMaterialButton(
                                  onPressed: () {},
                                  fillColor: Colors.white,
                                  child: Icon(
                                    Icons.add,
                                    size: 25.0,
                                  ),
                                  elevation: 20,
                                  padding: EdgeInsets.all(8.0),
                                  shape: CircleBorder(),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
