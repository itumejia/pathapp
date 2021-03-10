import 'package:flutter/material.dart';
import 'package:pathapp/screens/Habilidades.dart';
import 'package:pathapp/utilities/components/capital_habilidades.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pathapp/utilities/constants.dart';
import 'package:pathapp/utilities/functions/alerta.dart';
import 'package:pathapp/utilities/models/HabilidadesStructure.dart';
import 'package:pathapp/screens/HabilidadesPersona.dart';
import 'package:pathapp/utilities/components/backButton.dart';
import '../utilities/components/diamond.dart';
import '../utilities/components/roundedContainer.dart';
import 'package:pathapp/utilities/components/fonts.dart';

class CapitalHabilidadesScreen extends StatelessWidget {
  static String id = 'cap_habilidades_screen';

  CapitalHabilidadesScreen({@required this.carreras});
  List<dynamic> carreras = [];

  final List<List<TextEditingController>> matrizControladores = [];
  final List<HabilidadesPorCarrera> habCarreras = [];

  void createControladores() {
    for (int i = 0; i < carreras.length; i++) {
      List<TextEditingController> controladores = [
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
      ];
      matrizControladores.add(controladores);
    }
  }

  List<Widget> createList(double screenheight, double screenwidth) {
    createControladores();
    List<Widget> widgets = [];
    for (int i = 0; i < carreras.length; i++) {
      if (i % 2 == 0) {
        widgets.add(CapitalHabilidadesWidgetLeft(
          carrera: carreras[i],
          controlador1: matrizControladores[i][0],
          controlador2: matrizControladores[i][1],
          controlador3: matrizControladores[i][2],
          screenHeight: screenheight,
          screenWidth: screenwidth,
        ));
      } else {
        widgets.add(CapitalHabilidadesWidgetRight(
          carrera: carreras[i],
          controlador1: matrizControladores[i][0],
          controlador2: matrizControladores[i][1],
          controlador3: matrizControladores[i][2],
          screenHeight: screenheight,
          screenWidth: screenwidth,
        ));
      }
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final double widthScreenPercentage = MediaQuery.of(context).size.width;
    final double heightScreenPercentage = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kColorVerdeBosque,
      floatingActionButton: RawMaterialButton(
        child: Icon(
          Icons.check,
          color: Colors.black,
        ),
        fillColor: Colors.white,
        elevation: 10,
        shape: CircleBorder(),
        padding: EdgeInsets.all(widthScreenPercentage * 0.02),
        onPressed: () {
          print(carreras.length);
          bool completo = true;
          print(matrizControladores.length);

          for (int i = 0; i < carreras.length; i++) {
            for (int j = 0; j < matrizControladores[i].length; j++) {
              print("Mensaje de ${i} es ${matrizControladores[i][j].text}");
              if (matrizControladores[i][j].text == "") {
                completo = false;
                break;
              }
            }
          }

          if (completo == false) {
            mostrarAlerta(context, "Contesta por favor",
                "No has calificado todos los campos, por favor intenta de nuevo");
          } else {
            for (int i = 0; i < carreras.length; i++) {
              List<HabilidadRating> habilidadesRatingList = [];
              for (int j = 0; j < matrizControladores[i].length; j++) {
                habilidadesRatingList.add(HabilidadRating(
                    habilidad: matrizControladores[i][j].text, rating: 0));
              }
              habCarreras.add(HabilidadesPorCarrera(
                  carrera: carreras[i],
                  habilidadesRating: habilidadesRatingList));
            }

            for (int i = 0; i < habCarreras.length; i++) {
              habCarreras[i].printHabCar();
            }

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    HabilidadesPersona(habilidadesCarreras: habCarreras),
              ),
            );
          }
        },
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation
      body: SafeArea(
        child: Stack(children: [
          SvgPicture.asset(
            "assets/images/hojitas.svg",
            width: MediaQuery.of(context).size.width,
          ),
          backButton(
              on_pressed: () {
                Navigator.pop(context);
              },
              screenWidth: widthScreenPercentage),
          Column(children: [
            Padding(
              padding: EdgeInsets.only(
                  top: heightScreenPercentage * 0.12,
                  bottom: heightScreenPercentage * 0.03),
              child: roundedContainer(
                heightPercentage: heightScreenPercentage * 0.09,
                widthPercentage: widthScreenPercentage * 0.9,
                childContainer: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    diamond(diamondSize: widthScreenPercentage * 0.05),
                    Container(
                      width: widthScreenPercentage * 0.07,
                    ),
                    fontStyleAmaranth(
                      text: '¿QUÉ HABILIDADES \n TE GUSTARÍA APRENDER?',
                      sizePercentage: 2.4,
                      color: Colors.white,
                      letterSpacing: widthScreenPercentage * 0.002,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children:
                    createList(heightScreenPercentage, widthScreenPercentage),
              ),
            ),
            Container(
              height: heightScreenPercentage * 0.12,
            ),
          ]),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: heightScreenPercentage * .02,
                  right: widthScreenPercentage * 0.18),
              child: RawMaterialButton(
                child: Icon(
                  Icons.help_outline_sharp,
                  color: Colors.black,
                ),
                fillColor: Colors.white,
                elevation: 10,
                padding: EdgeInsets.all(widthScreenPercentage * 0.02),
                shape: CircleBorder(),
                onPressed: () {}, //TODO: pantalla de about
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
