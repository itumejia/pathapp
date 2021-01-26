import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pathapp/screens/Valores.dart';
import 'package:pathapp/screens/about_screen.dart';
import 'package:pathapp/utilities/components/RoundedButton.dart';
import 'package:pathapp/utilities/components/ReusableCard.dart';
import 'package:pathapp/utilities/components/CardIcon.dart';
import 'package:pathapp/utilities/constants.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pathapp/utilities/functions/firebaseFunctions.dart';
import 'package:pathapp/screens/sesion_screen.dart';
import 'package:pathapp/screens/NavegadorCapital_screen.dart';
import 'package:pathapp/utilities/components/fonts.dart';
import 'package:pathapp/screens/problemas_del_mundo.dart';

class SeccionesScreen extends StatefulWidget {
  static String id = 'menu_screen';
  @override
  _SeccionesScreenState createState() => _SeccionesScreenState();
}

class _SeccionesScreenState extends State<SeccionesScreen> {
  User loggedUser;
  double progreso = 0.0;
  final _cloud = FirebaseFirestore.instance.collection('/usuarios');
  bool saving = false;

  List<dynamic> carreras;
  //Indicadores de tests completados
  bool ramas = false, impacto = false, capital = false, personal = false;

  void getCurrentUser() async {
    try {
      final author = FirebaseAuth.instance;
      loggedUser = await author.currentUser;
      if (loggedUser != null) {
        print(loggedUser.email);
      } else {
        Navigator.pushReplacementNamed(context, sesionScreen.id);
      }
    } catch (e) {
      print(e);
    }
  }

  void getInfo() async {
    Map info = await getData(loggedUser.email);
    print('getting data');

    carreras = info['carreras'];

    if (info['versatilidad'].length != 0 || info['prestigio'].length != 0) {
      progreso += 16.5;
      if (info['versatilidad'].length != 0 && info['prestigio'].length != 0) {
        progreso += 16.5;
        ramas = true;
      }
    }

    if (info['imp_social'].length != 0) {
      impacto = true;
      progreso += 16.5;
    }

    if (info['cap_habilidades'].length != 0 ||
        info['cap_personas'].length != 0) {
      progreso += 16.5;
      if (info['cap_habilidades'].length != 0 &&
          info['cap_personas'].length != 0) {
        progreso += 16.5;
        capital = true;
      }
    }

    if (info['personal_fit'].length != 0) {
      personal = true;
      progreso += 17;
    }

    print(ramas);
    print(impacto);
    print(capital);
    print(personal);
  }

  void update() async {
    await getCurrentUser();
    await getInfo();
    setState(() {
      print('set');
    });
  }

  @override
  void initState() {
    super.initState();
    print('INIT');
    update();
  }

  @override
  Widget build(BuildContext context) {
    final double widthScreenPercentage = MediaQuery.of(context).size.width;
    final double heightScreenPercentage = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kColorBlancoOpaco,
      body: SafeArea(
        child: Container(
          width: widthScreenPercentage,
          height: heightScreenPercentage,
          child: Padding(
            padding: EdgeInsets.only(top: heightScreenPercentage * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: widthScreenPercentage * 0.9,
                  height: heightScreenPercentage * 0.19,
                  child: Padding(
                    padding: EdgeInsets.all(heightScreenPercentage * 0.013),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: widthScreenPercentage * 0.02),
                            child: fontStyleMPlus(
                                text: "Continúa tu aventura...",
                                sizePercentage: 2.5,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: heightScreenPercentage * 0.02,
                              right: widthScreenPercentage * 0.02),
                          child: LinearPercentIndicator(
                            alignment: MainAxisAlignment.end,
                            width: widthScreenPercentage * 0.55,
                            animation: true,
                            lineHeight: heightScreenPercentage * 0.03,
                            animationDuration: 1000,
                            percent: progreso / 100,
                            center: Text("${progreso}%"),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: Colors.white,
                          ),
                        ),
                        Opacity(
                          opacity: progreso == 100 ? 100 : 0,
                          child: RoundedButton(
                            screenHeight: heightScreenPercentage,
                            titleText: 'VER RESULTADOS',
                            colorProperty: Colors.white,
                            onPressedFunction: () {
                              //Condición para saber si el progreso ya está en 100
                              if (progreso == 100) {
                                //Navegar a pantalla de resultados
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  margin: EdgeInsets.all(widthScreenPercentage * 0.03),
                  decoration: BoxDecoration(
                    color: kColorMorado,
                    borderRadius:
                        BorderRadius.circular(widthScreenPercentage * 0.05),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(4, 8),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(widthScreenPercentage * 0.02),
                      child: Container(
                        width: widthScreenPercentage * 0.4,
                        height: heightScreenPercentage * 0.28,
                        child: ReusableCard(
                          widthScreen: widthScreenPercentage,
                          colore: ramas ? kColorGrisCards : kColorAzul,
                          tapFunction: () => {}, //Ir a navegador de ramas
                          cardChild: CardIcon(
                            screenHeigth: heightScreenPercentage,
                            screenWidth: widthScreenPercentage,
                            cardColor: ramas ? kColorGrisCards : kColorAzul,
                            nameImage: 'assets/images/light-bulb.png',
                            iconTitle: 'Ramas del conocimiento',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(widthScreenPercentage * 0.02),
                      child: Container(
                        width: widthScreenPercentage * 0.4,
                        height: heightScreenPercentage * 0.28,
                        child: ReusableCard(
                          widthScreen: widthScreenPercentage,
                          colore: impacto ? kColorGris : kColorAmarillo,
                          tapFunction: () {
                            Navigator.pushNamed(context, problemasMundo.id);
                          }, //Ir a test de problemas del mundo
                          cardChild: CardIcon(
                            screenHeigth: heightScreenPercentage,
                            screenWidth: widthScreenPercentage,
                            cardColor:
                                impacto ? kColorGrisCards : kColorAmarillo,
                            nameImage: 'assets/images/world-map.png',
                            iconTitle: 'Problemas del mundo',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(widthScreenPercentage * 0.02),
                      child: Container(
                        width: widthScreenPercentage * 0.4,
                        height: heightScreenPercentage * 0.28,
                        child: ReusableCard(
                          widthScreen: widthScreenPercentage,
                          colore: capital ? kColorGris : kColorNaranja,
                          tapFunction: () => Navigator.pushNamed(
                              context, Valores.id), //Ir a navegador de capital
                          cardChild: CardIcon(
                            screenHeigth: heightScreenPercentage,
                            screenWidth: widthScreenPercentage,
                            cardColor:
                                capital ? kColorGrisCards : kColorNaranja,
                            nameImage: 'assets/images/treasure.png',
                            iconTitle: 'Capital de carrera',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(widthScreenPercentage * 0.02),
                      child: Container(
                        width: widthScreenPercentage * 0.4,
                        height: heightScreenPercentage * 0.28,
                        child: ReusableCard(
                          widthScreen: widthScreenPercentage,
                          colore: personal ? kColorGris : kColorCafe,
                          tapFunction: () =>
                              Navigator.pushNamed(context, Valores.id),
                          cardChild: CardIcon(
                            screenHeigth: heightScreenPercentage,
                            screenWidth: widthScreenPercentage,
                            cardColor: personal ? kColorGris : kColorCafe,
                            nameImage: 'assets/images/paper-plane.png',
                            iconTitle: 'Personal fit',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: heightScreenPercentage * 0.025,
                      right: widthScreenPercentage * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: RawMaterialButton(
                          elevation: 10,
                          onPressed: () {
                            Navigator.pushNamed(context, aboutScreen.id);
                          },
                          fillColor: kColorBlancoBoton,
                          child: Icon(
                            Icons.help_outline_sharp,
                            color: Colors.black,
                          ),
                          shape: CircleBorder(),
                        ),
                        width: widthScreenPercentage * 0.1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: widthScreenPercentage * 0.025),
                        child: Container(
                          child: RawMaterialButton(
                            elevation: 10,
                            fillColor: kColorBlancoBoton,
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, sesionScreen.id);
                            },
                            child: Icon(
                              Icons.exit_to_app,
                              color: Colors.black,
                            ),
                            shape: CircleBorder(),
                          ),
                          width: widthScreenPercentage * 0.1,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
