import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pie_chart/pie_chart.dart' as circularChart;
import 'package:fl_chart/fl_chart.dart';
import 'package:pathapp/utilities/constants.dart';
import 'package:pathapp/utilities/components/backButton.dart';
import 'package:pathapp/screens/Secciones.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pathapp/utilities/components/fonts.dart';
import 'package:pathapp/utilities/functions/firebaseFunctions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pathapp/utilities/functions/alerta.dart';
import 'package:pathapp/screens/sesion_screen.dart';

class CarreraRes{
  String carrera;
  double resultado;

  String getCarrera(){
    return carrera;
  }

  double getResultado(){
    return resultado;
  }


  CarreraRes(this.carrera, this.resultado);
}

class TestData{
  String test;
  List<CarreraRes> puntajes=[];

  TestData(this.test);

  void addCarrera(String carrera, double puntaje){
    puntajes.add(CarreraRes(carrera, puntaje));
  }

  void printPuntajes(){
    print(test);
    for(int i=0;i<puntajes.length;i++){
      print("Carrera: ${puntajes[i].getCarrera()}, Resultado: ${puntajes[i].getResultado()}");
    }
  }

}



class resultadosScreen extends StatefulWidget {
  static String id = 'resultados_screen';

  @override
  _resultadosScreenState createState() => _resultadosScreenState();
}


class _resultadosScreenState extends State<resultadosScreen> {
  Map<String, dynamic> datos={};
  User loggedUser;
  final _cloud=FirebaseFirestore.instance.collection('/usuarios');
  bool saving = false;
  List<dynamic> procesado;

  void getCurrentUser() async {
    try {
      final author = FirebaseAuth.instance;
      loggedUser = await author.currentUser;
      if (loggedUser != null) {
        print(loggedUser.email);
      }
    } on FirebaseAuthException catch (e) {
      mostrarAlerta(context, "Usuario no identificado", e.message );
      Navigator.pushReplacementNamed(context, sesionScreen.id);
      print(e);
    }
  }




  List<dynamic> procesar(Map<String, dynamic> data){
    Map<String, double> pastel={};
    List<TestData> barras=[TestData("Ramas del Conocimiento: Versatilidad"),TestData("Ramas del Conocimiento: Prestigio"),TestData("Capital de Carrera: Habilidades"),TestData("Capital de Carrera: Personas"),TestData("Impacto Social"), TestData("Personal Fit")];
    for(int i=0; i<data['carreras'].length;i++){

      double aux;
      String carrera=data['carreras'][i];
      double aux2=data["cap_habilidades"][carrera].toDouble();
      barras[2].addCarrera(carrera, aux2);

      aux=data["cap_personas"][carrera].toDouble();
      barras[3].addCarrera(carrera, aux);

      double ramas=(aux2+aux)/2;

      aux2=data["prestigio"][carrera].toDouble();
      barras[1].addCarrera(carrera, aux2);

      aux=data["versatilidad"][carrera].toDouble();
      barras[0].addCarrera(carrera, aux);

      double capital=(aux2+aux)/2;

      aux=data["imp_social"][carrera].toDouble();
      barras[4].addCarrera(carrera, aux);

      aux2=data["personal_fit"][carrera].toDouble();
      barras[5].addCarrera(carrera, aux2);

      pastel[carrera]=ramas+capital+aux+aux2;
    }

    return [pastel, barras];

  }

  void update() async {
    await getCurrentUser();
    datos= await getData(context, loggedUser.email);
    // setState(() {
    //   print(datos["cap_personas"]);
    // });
    procesado= procesar(datos);
    print(procesado[0]);
    for(int i =0; i<procesado[1].length; i++){
      procesado[1][i].printPuntajes();
    }
  }

  @override
  void initState(){
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
        child: Stack(
          children: [
            backButton(
                on_pressed: () {
                  Navigator.pushReplacementNamed(context, SeccionesScreen.id);
                },
                screenWidth: widthScreenPercentage),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: heightScreenPercentage * 0.07),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: widthScreenPercentage * 0.025),
                        child: SvgPicture.asset(
                          'assets/images/star.svg',
                          width: widthScreenPercentage * 0.13,
                        ),
                      ),
                      fontStyleAmaticSC(
                        text: 'RESULTADOS',
                        sizePercentage: 4.5,
                        color: kColorMorado,
                        letterSpacing: widthScreenPercentage * 0.008,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: heightScreenPercentage * 0.05),
                  child: Container(
                    width: widthScreenPercentage * 0.8,
                    height: heightScreenPercentage * 0.17,
                    decoration: BoxDecoration(
                      color: kColorMorado,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          offset: Offset(10, 10),
                          spreadRadius: 2,
                          blurRadius: 7,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        fontStyleDidactGothic(
                            text: 'Puntuación más alta: \n ITC',
                            sizePercentage: 2.8,
                            color: Colors.white),
                        Padding(
                          padding: EdgeInsets.only(
                              left: widthScreenPercentage * 0.04),
                          child: Container(
                            width: widthScreenPercentage * 0.2,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: widthScreenPercentage * 0.003,
                              ),
                            ),
                            child: SvgPicture.asset(
                              'assets/images/iconoCarreras.svg',
                              width: widthScreenPercentage * 0.15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: heightScreenPercentage * 0.05),
                  child: Container(
                    width: 0.8 * widthScreenPercentage,
                    height: 0.5 * heightScreenPercentage,
                    color: Colors.white60,
                    child: ListView(children: [
                      Container(
                          width: 0.8 * widthScreenPercentage,
                          height: 0.5 * heightScreenPercentage,
                          color: Colors.black),
                      Container(
                        width: 0.8 * widthScreenPercentage,
                        height: 0.5 * heightScreenPercentage,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              width: 0.8 * widthScreenPercentage,
                              height: 0.5 * heightScreenPercentage,
                              color: Colors.blue,
                            ),
                            Container(
                              width: 0.8 * widthScreenPercentage,
                              height: 0.5 * heightScreenPercentage,
                              color: Colors.red,
                            ),
                            Container(
                              width: 0.8 * widthScreenPercentage,
                              height: 0.5 * heightScreenPercentage,
                              color: Colors.purple,
                            ),
                            Container(
                              width: 0.8 * widthScreenPercentage,
                              height: 0.5 * heightScreenPercentage,
                              color: Colors.green,
                            ),
                            Container(
                              width: 0.8 * widthScreenPercentage,
                              height: 0.5 * heightScreenPercentage,
                              color: Colors.yellow,
                              child: Center(
                                child: fontStyleAmaticSC(
                                    text: 'Chinga tu madre ituriel',
                                    sizePercentage: 5,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
