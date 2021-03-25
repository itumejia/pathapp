import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pathapp/screens/Habilidades.dart';
import 'package:pathapp/screens/about_screen.dart';
import 'package:pathapp/utilities/components/count_button.dart';
import 'package:pathapp/utilities/constants.dart';
import 'package:pathapp/utilities/components/leftRow.dart';
import 'package:pathapp/utilities/components/rigthRow.dart';
import 'package:pathapp/utilities/functions/alerta.dart';
import 'package:pathapp/utilities/models/HabilidadesStructure.dart';
import 'package:pathapp/utilities/textos_about.dart';
import 'package:pathapp/screens/about_screen.dart';

//Primera pantalla de personal Fit
class Valores extends StatefulWidget {
  static String id='personal_habilidades_screen';
  bool primeraVez;
  Valores({@required this.carreras, @required this.primeraVez});
  List<dynamic> carreras=[];
  @override
  _ValoresState createState() => _ValoresState();
}

class _ValoresState extends State<Valores> {

  //Controladores para las 5 rows de las habilidades personales
  List<TextEditingController> controladores= [TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorMorado,
      floatingActionButton: Container(
        child: RawMaterialButton(
          elevation: 10,
          constraints: BoxConstraints(minWidth: 40, maxWidth: 40, minHeight: 40, maxHeight: 40),
          onPressed: () {
            //Verificar si todas las rows han sido llenadas, si no, se muestra la alerta
            List<HabilidadesPorCarrera> car=[]; //También se construye el objeto que se pasa a la pantalla de Habilidades
            for(int i=0; i < widget.carreras.length;i++) {
              List<HabilidadRating> habilidades=[]; //Arreglo de habilidades con su rating
              for(int i=0; i<controladores.length;i++){
                if(controladores[i].text==""){
                  mostrarAlerta(context, "Contesta por favor", "No has llenado todos los campos, por favor intenta de nuevo");
                  return;
                }
                habilidades.add(HabilidadRating(habilidad: controladores[i].text,rating: 0));
              }
              //Armar objeto con carrera y array de habilidades
              car.add(HabilidadesPorCarrera(carrera: widget.carreras[i], habilidadesRating: habilidades));
            }

            //Si es la primera vez pasar por el About, si no ir directo a pantalla siguiente
            if(widget.primeraVez){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => aboutScreen(
                    titulo: kAboutPersonalTitulo,
                    cuerpo: kAboutPersonal2Cuerpo,
                    image: "assets/images/efectosFondo2.svg",
                    colorFondo: kColorMorado,
                    colorTexto: kColorAzulMarino,
                    navegar: (){
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HabilidadesScreen(habilidadesCarreras: car),
                        ),
                      );
                    },),
                ),
              );
            }
            else{
              //Navegar a Habilidades mandando el objeto car
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HabilidadesScreen(habilidadesCarreras: car),
                ),
              );
            }
          },
          fillColor: Colors.white,
          child: Icon(
            Icons.help_outline_sharp,
            color: Colors.black,
          ),
          shape: CircleBorder(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Container(
        child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget> [
          Padding(
            padding: EdgeInsets.only(top: 30.0, bottom: 30.0, right: 20.0, left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //Se arma de manera manual las 5 rows derecha e izquierda
                rightRow(
                  controlador: controladores[0],
                  circleCont:
                  Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment(0.7,-1),
                      child: SizedBox(
                        width: 20.0,
                        height: 20.0,
                        child: Container(
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: kColorLilaBrilla,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                leftRow(
                  controlador: controladores[1],
                  circleCont:
                  Container(
                    height: 60,
                  ),
                ),
                rightRow(
                  controlador: controladores[2],
                  circleCont:
                  Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 20.0,
                        height: 20.0,
                        child: Container(
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: kColorLilaBrilla,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                leftRow(
                  controlador: controladores[3],
                  circleCont:
                  Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment(1,-0.8),
                      child: SizedBox(
                        width: 20.0,
                        height: 20.0,
                        child: Container(
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: kColorLilaBrilla,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                    rightRow(
                      controlador: controladores[4],
                      circleCont:
                      Container(
                        height: 60,
                        child: Align(
                          alignment: Alignment(-0.2, 1),
                          child: SizedBox(
                            width: 20.0,
                            height: 20.0,
                            child: Container(
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: kColorLilaBrilla,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Stack(
                            overflow: Overflow.visible,
                            alignment: Alignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(15),
                                width: 140.0,
                                height: 140.0,
                                margin: EdgeInsets.only(bottom: 5.0),
                                decoration: BoxDecoration(
                                  color: kColorMoradoGris,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Positioned(
                                bottom: -95,
                                child: Container(
                                  padding: EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 5),
                                  width: 320,
                                  height: 140,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Ordena de mayor a menor importancia cada una de las propiedades que componen tu persona",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "PERSONAL FIT",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kColorMoradotOpaco,
                                          fontSize: 35,
                                        ),
                                      ),
                                    ],
                                  ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                    )
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  child: Image.asset('assets/images/player.png'),
                                  width: 140.0,
                                  height: 140.0,
                                  margin: EdgeInsets.only(bottom: 5.0),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                child: Container(
                                  width: 1,
                                  height: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 100,),
                Container(
                  width: MediaQuery.of(context).size.width*0.7,
                  margin: EdgeInsets.only(top: 10.0),
                  child: CountButton(
                    screenWidth: MediaQuery.of(context).size.width,
                    screenHeight: MediaQuery.of(context).size.height,
                    text: "CONTINUAR",
                    color: kColorBlancoOpaco,
                    fontcolor: kColorUniverso,
                    function: () {

                      //Verificar si todas las rows han sido llenadas, si no, se muestra la alerta
                      List<HabilidadesPorCarrera> car=[]; //También se construye el objeto que se pasa a la pantalla de Habilidades
                      for(int i=0; i < widget.carreras.length;i++) {
                        List<HabilidadRating> habilidades=[]; //Arreglo de habilidades con su rating
                        for(int i=0; i<controladores.length;i++){
                          if(controladores[i].text==""){
                            mostrarAlerta(context, "Contesta por favor", "No has llenado todos los campos, por favor intenta de nuevo");
                            return;
                          }
                          habilidades.add(HabilidadRating(habilidad: controladores[i].text,rating: 0));
                        }
                        //Armar objeto con carrera y array de habilidades
                        car.add(HabilidadesPorCarrera(carrera: widget.carreras[i], habilidadesRating: habilidades));
                      }
                      //Navegar a Habilidades mandando el objeto car
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HabilidadesScreen(habilidadesCarreras: car),
                        ),
                      );
                    },
                  ),
                ),
                  ],
            )
          ),
        ]
        ),
      ),
    );
  }
}
