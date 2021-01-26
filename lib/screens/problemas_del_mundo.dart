import 'package:flutter/material.dart';
import 'package:pathapp/utilities/components/fonts.dart';
import 'package:pathapp/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:pathapp/utilities/components/backButton.dart';
import 'package:pathapp/screens/Secciones.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utilities/components/diamond.dart';
import '../utilities/components/roundedContainer.dart';
import 'package:pathapp/utilities/components/count_button.dart';
import 'package:pathapp/utilities/components/textFieldProblemas.dart';
import 'package:pathapp/screens/impacto_problemas_screen.dart';

class problemasMundo extends StatefulWidget {
  static String id = 'problemas_mundo_screen';
  @override
  _problemasMundoState createState() => _problemasMundoState();
}

class _problemasMundoState extends State<problemasMundo> {
  final controllerp1 = TextEditingController();
  final controllerp2 = TextEditingController();
  final controllerp3 = TextEditingController();
  final controllerp4 = TextEditingController();
  final controllerp5 = TextEditingController();
  String p1String;
  String p2String;
  String p3String;
  String p4String;
  String p5String;
  bool p1bool = true;
  bool p2bool = true;
  bool p3bool = true;
  bool p4bool = true;
  bool p5bool = true;
  bool _saving = false;
  bool todoChido = true;
  @override
  Widget build(BuildContext context) {
    final double widthScreenPercentage = MediaQuery.of(context).size.width;
    final double heightScreenPercentage = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kColorUniverso,
      body: ListView(children: [
        Stack(
          children: [
            backButton(
                on_pressed: () {
                  Navigator.pushReplacementNamed(context, SeccionesScreen.id);
                },
                screenWidth: widthScreenPercentage),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: heightScreenPercentage * 0.20),
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
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: widthScreenPercentage,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: heightScreenPercentage * 0.12),
                    child: roundedContainer(
                      heightPercentage: heightScreenPercentage * 0.06,
                      widthPercentage: widthScreenPercentage * 0.76,
                      childContainer: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          diamond(diamondSize: widthScreenPercentage * 0.05),
                          Container(
                            width: widthScreenPercentage * 0.04,
                          ),
                          fontStyleAmaranth(
                              text: 'AÑADE 4 PROBLEMAS',
                              sizePercentage: 2.4,
                              color: Colors.white,
                              letterSpacing: widthScreenPercentage * 0.005),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: heightScreenPercentage * 0.025),
                    child: Image.asset(
                      'assets/images/mundo.png',
                      scale: widthScreenPercentage * 0.0028,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: heightScreenPercentage * 0.025),
                    child: Container(
                      width: widthScreenPercentage * 0.75,
                      height: heightScreenPercentage * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight:
                                Radius.circular(widthScreenPercentage * 0.13),
                            bottomLeft:
                                Radius.circular(widthScreenPercentage * 0.13)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: heightScreenPercentage * 0.015,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: widthScreenPercentage * 0.035,
                                      left: widthScreenPercentage * 0.02),
                                  child: Container(
                                    child: fontStyleMPlus(
                                        text: '#1',
                                        sizePercentage: 3,
                                        color: kColorUniverso),
                                  ),
                                ),
                                Container(
                                  height: heightScreenPercentage * 0.06,
                                  width: widthScreenPercentage * 0.56,
                                  child: TextField(
                                    controller: controllerp1,
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      p1String = value;
                                    },
                                    decoration: p1bool
                                        ? textFieldProblemas(
                                            "Introduce el primer problema",
                                            widthScreenPercentage,
                                            heightScreenPercentage,
                                            Colors.grey)
                                        : textFieldProblemas(
                                            "Problema faltante",
                                            widthScreenPercentage,
                                            heightScreenPercentage,
                                            Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: heightScreenPercentage * 0.015),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: widthScreenPercentage * 0.035,
                                      left: widthScreenPercentage * 0.02),
                                  child: Container(
                                    child: fontStyleMPlus(
                                        text: '#2',
                                        sizePercentage: 3,
                                        color: kColorUniverso),
                                  ),
                                ),
                                Container(
                                  height: heightScreenPercentage * 0.06,
                                  width: widthScreenPercentage * 0.56,
                                  child: TextField(
                                    controller: controllerp2,
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      p2String = value;
                                    },
                                    decoration: p2bool
                                        ? textFieldProblemas(
                                            "Introduce el segundo problema",
                                            widthScreenPercentage,
                                            heightScreenPercentage,
                                            Colors.grey)
                                        : textFieldProblemas(
                                            "Problema faltante",
                                            widthScreenPercentage,
                                            heightScreenPercentage,
                                            Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: heightScreenPercentage * 0.015),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: widthScreenPercentage * 0.035,
                                      left: widthScreenPercentage * 0.02),
                                  child: Container(
                                    child: fontStyleMPlus(
                                        text: '#3',
                                        sizePercentage: 3,
                                        color: kColorUniverso),
                                  ),
                                ),
                                Container(
                                  height: heightScreenPercentage * 0.06,
                                  width: widthScreenPercentage * 0.56,
                                  child: TextField(
                                    controller: controllerp3,
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      p3String = value;
                                    },
                                    decoration: p3bool
                                        ? textFieldProblemas(
                                            "Introduce el tercer problema",
                                            widthScreenPercentage,
                                            heightScreenPercentage,
                                            Colors.grey)
                                        : textFieldProblemas(
                                            "Problema faltante",
                                            widthScreenPercentage,
                                            heightScreenPercentage,
                                            Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: heightScreenPercentage * 0.015),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: widthScreenPercentage * 0.035,
                                      left: widthScreenPercentage * 0.02),
                                  child: Container(
                                    child: fontStyleMPlus(
                                        text: '#4',
                                        sizePercentage: 3,
                                        color: kColorUniverso),
                                  ),
                                ),
                                Container(
                                  height: heightScreenPercentage * 0.06,
                                  width: widthScreenPercentage * 0.56,
                                  child: TextField(
                                    controller: controllerp4,
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      p4String = value;
                                    },
                                    decoration: p4bool
                                        ? textFieldProblemas(
                                            "Introduce el cuarto problema",
                                            widthScreenPercentage,
                                            heightScreenPercentage,
                                            Colors.grey)
                                        : textFieldProblemas(
                                            "Problema faltante",
                                            widthScreenPercentage,
                                            heightScreenPercentage,
                                            Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: heightScreenPercentage * 0.005),
                    child: CountButton(
                      screenWidth: widthScreenPercentage,
                      screenHeight: heightScreenPercentage,
                      text: 'CONTINUAR',
                      color: kColorBlancoOpaco,
                      fontcolor: kColorUniverso,
                      function: () async {
                        setState(() {
                          _saving = true;
                        });
                        p1bool = true;
                        p2bool = true;
                        p3bool = true;
                        p4bool = true;
                        todoChido = true;
                        if (p1String == null) {
                          todoChido = false;
                          controllerp1.clear();
                          setState(() {
                            p1bool = false;
                          });
                        }
                        if (p2String == null) {
                          todoChido = false;
                          controllerp2.clear();
                          setState(() {
                            p2bool = false;
                          });
                        }
                        if (p3String == null) {
                          todoChido = false;
                          controllerp3.clear();
                          setState(() {
                            p3bool = false;
                          });
                        }
                        if (p4String == null) {
                          todoChido = false;
                          controllerp4.clear();
                          setState(() {
                            p4bool = false;
                          });
                        }
                        if (todoChido) {
                          Navigator.pushReplacementNamed(
                              context, impactoProblemas.id);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: heightScreenPercentage * 0.9,
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
          ],
        ),
      ]),
    );
  }
}
