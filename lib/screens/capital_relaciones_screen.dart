import 'package:flutter/material.dart';
import 'package:pathapp/utilities/components/instruction_box_widget2.dart';
import 'package:pathapp/utilities/components/relaciones_rating.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pathapp/screens/Secciones.dart';
import 'package:pathapp/utilities/functions/alerta.dart';
import 'package:pathapp/screens/sesion_screen.dart';
import 'package:pathapp/utilities/textos_about.dart';
import 'package:pathapp/screens/about_screen.dart';

class CapitalRelacionesScreen extends StatefulWidget {
  static String id='cap_relaciones_screen';

  CapitalRelacionesScreen({@required this.carreras});
  List<dynamic> carreras=[]; //Carreras del usuario

  @override
  _CapitalRelacionesScreenState createState() => _CapitalRelacionesScreenState();
}

class _CapitalRelacionesScreenState extends State<CapitalRelacionesScreen> {

  User loggedUser; //Instancia de usuario autenticado

  final _cloud=FirebaseFirestore.instance.collection('/usuarios'); //Instanccia de la base de datos

  bool saving=false; //Controlado del modal progress hud

  Map<String, int> results={}; //Mapa de resultados

  //Funcion que obtiene el usuario actual
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

  //Crea lista de widget RelacionesRating, con el nombre de cada carrera
  List<RelacionesRating> createList(){
    List<RelacionesRating> widgets=[];
    for(int i=0; i<widget.carreras.length;i++){
      widgets.add(RelacionesRating(carrera: widget.carreras[i],));
    }
    return widgets;
  }

//Al iniciar se obtiene el usuario
  void initState() {
    super.initState();
    getCurrentUser();
  }


  @override
  Widget build(BuildContext context) {
    final List<RelacionesRating> RatingWidgets=createList();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          //Se verifica que se hayan calificado todas las carreras
          bool completado=true;
          for(int i=0;i<RatingWidgets.length;i++){
            if(RatingWidgets[i].rating==null){
              completado=false;
              break;
            }
          }
          //Si no se completo, se muestra alerta
          if(completado==false){
            mostrarAlerta(context, "Califica por favor", "No has calificado todas tus carreras, por favor intenta de nuevo");
          }
          //Si se completo, se envia a base de datos
          else{
            setState(() {
              saving=true;
            });

            //Se pone en forma de diccionario y se transforma a calificacion de 0-100
            for (int i = 0; i < RatingWidgets.length; i++) {
              results[RatingWidgets[i].carrera]=RatingWidgets[i].rating*20;
            }
            print(results);
            //Se envia a base de datos y regresa a menu principal
            try {
              _cloud
                  .doc(loggedUser.email) //Usuario
                  .update({
                "cap_personas": results,
              });

              Navigator.pushNamedAndRemoveUntil(context,SeccionesScreen.id,(Route<dynamic> route) => false);
            }
            catch(e){
              mostrarAlerta(context, "No se pudieron subir los datos", e);
              print(e);
            }

            setState(() {
              saving=false;
            });
          }
        },
        child: Icon(Icons.check, color: Colors.white,),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Color(0xffC3DA67),
      body: ModalProgressHUD(
        inAsyncCall: saving,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.05),
                    child: RawMaterialButton(
                      elevation: 10,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => aboutScreen(
                              titulo: kAboutCapitalRelacionesTitulo,
                              cuerpo: kAboutCapitalRelacionesCuerpo,
                            ),
                          ),
                        );
                      },
                      fillColor: Colors.white,
                      child: Icon(
                        Icons.help_outline_sharp,
                        color: Colors.black,
                      ),
                      shape: CircleBorder(),
                    ),
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                ),
                InstructionBoxWidget(
                  texto: '¿TE SERÍA FÁCIL RELACIONARTE CON PERSONAS DE LA CARRERA?',
                  toDo: (){
                    print(RatingWidgets[0].rating);
                    print(RatingWidgets[1].rating);
                  },
                ),
                Expanded(
                  //Lista de ratings, guardados en RatingWidgets
                  child: ListView(
                    children: RatingWidgets,
                  ),
                ),
                Image.asset(
                  "assets/images/circulo_arboles.png",
                  width: MediaQuery.of(context).size.width,
                ),
              ]
          ),
        ),
      ),
    );
  }
}
