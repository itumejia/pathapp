import 'package:flutter/material.dart';
import 'package:pathapp/screens/Habilidades.dart';
import 'package:pathapp/utilities/components/capital_habilidades.dart';
import 'package:pathapp/utilities/components/instruction_box_widget2.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pathapp/utilities/functions/alerta.dart';
import 'package:pathapp/utilities/models/HabilidadesStructure.dart';
import 'package:pathapp/screens/HabilidadesPersona.dart';

class CapitalHabilidadesScreen extends StatelessWidget {
  static String id = 'cap_habilidades_screen';

  CapitalHabilidadesScreen({@required this.carreras});
  List<dynamic> carreras=[];

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


  List<Widget> createList() {
    createControladores();
    List<Widget> widgets = [];
    for (int i = 0; i < carreras.length; i++) {
      if (i % 2 == 0) {
        widgets.add(CapitalHabilidadesWidgetLeft(carrera: carreras[i],
          controlador1: matrizControladores[i][0],
          controlador2: matrizControladores[i][1],
          controlador3: matrizControladores[i][2],));
      }
      else {
        widgets.add(CapitalHabilidadesWidgetRight(carrera: carreras[i],
          controlador1: matrizControladores[i][0],
          controlador2: matrizControladores[i][1],
          controlador3: matrizControladores[i][2],));
      }
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffC3DA67),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check, color: Colors.white,),
        backgroundColor: Colors.black,
        onPressed: (){
          print(carreras.length);
          bool completo=true;
          print(matrizControladores.length);

          for(int i=0; i < carreras.length;i++) {
            for (int j = 0; j < matrizControladores[i].length; j++) {
              print("Mensaje de ${i} es ${matrizControladores[i][j].text}");
              if (matrizControladores[i][j].text == "") {
                completo = false;
                break;
              }
            }
          }


          if(completo==false){
            mostrarAlerta(context,"Contesta por favor", "No has calificado todos los campos, por favor intenta de nuevo");
          }else{
            for(int i=0;i<carreras.length;i++) {
              List<HabilidadRating> habilidadesRatingList = [];
              for (int j = 0; j < matrizControladores[i].length; j++) {
                habilidadesRatingList.add(HabilidadRating(habilidad: matrizControladores[i][j].text, rating: 0));
              }
              habCarreras.add(HabilidadesPorCarrera(carrera: carreras[i], habilidadesRating: habilidadesRatingList));
            }

            for(int i=0;i<habCarreras.length;i++){
              habCarreras[i].printHabCar();
            }

            Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => HabilidadesPersona(habilidadesCarreras: habCarreras),
            ),
            );
          }
        },
      ),
      body: Column(
        children: [
          SvgPicture.asset(
              "assets/images/curva_blanca.svg",
              width: MediaQuery.of(context).size.width,
          ),
          Expanded(
            child: ListView(
              children: createList(),
            ),
          ),
          InstructionBoxWidget(texto: '¿Qué habilidades te gustaría aprender?',),
        ]
      ),
    );
  }
}


