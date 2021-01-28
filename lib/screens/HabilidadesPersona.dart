import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pathapp/utilities/components/instruction_box_widget.dart';
import 'package:pathapp/utilities/constants.dart';
import 'package:pathapp/utilities/components/rating_row.dart';
import 'package:pathapp/utilities/functions/alerta.dart';
import 'package:pathapp/utilities/models/HabilidadesStructure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pathapp/utilities/functions/firebaseFunctions.dart';
import 'package:pathapp/screens/sesion_screen.dart';
import 'package:pathapp/screens/Secciones.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class HabilidadesPersona extends StatefulWidget {
  static String id='cap_rating_screen';
  final List<HabilidadesPorCarrera> habilidadesCarreras;

  HabilidadesPersona({this.habilidadesCarreras});

  @override
  _HabilidadesPersonaState createState() => _HabilidadesPersonaState();
}

class _HabilidadesPersonaState extends State<HabilidadesPersona> {

  int indexCarrera = 0;
  bool finish= false;
  User loggedUser;
  final _cloud=FirebaseFirestore.instance.collection('/usuarios');
  bool saving = false;
  Map<String, double> promediosPorCarrera={};
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


  @override
  void initState() {
    super.initState();
    print('INIT');
    getCurrentUser();
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
            backgroundColor: kColorVerdeClaro,
            body: ModalProgressHUD(
              inAsyncCall: saving,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 30.0, bottom: 30.0, right: 20.0, left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: Row(
                            children:[
                              Icon(
                                Icons.crop_square,
                                color: Colors.white,
                              ),
                              Expanded(
                                  child: InstructionBoxWidget(texto: '¿Qué tan importante es cada una de estas habilidades?')),
                            ]
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        child: Text(
                          widget.habilidadesCarreras[indexCarrera].getCarrera(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(15),
                        height: 60,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 8),
                              ),
                            ]
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Stack(
                          overflow: Overflow.visible,
                          alignment: Alignment.center,
                          children: <Widget>[
                            Container(
                              height: 250,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                  ),
                                ],
                              ),
                              child: ListView(
                                children: <Widget>[
                                  RatingRow(habilidadPair: widget.habilidadesCarreras[indexCarrera].getHabilidad(0), colore: kColorLila,),
                                  RatingRow(habilidadPair: widget.habilidadesCarreras[indexCarrera].getHabilidad(1), colore: kColorLila,),
                                  RatingRow(habilidadPair: widget.habilidadesCarreras[indexCarrera].getHabilidad(2), colore: kColorLila,)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
        ),
        indexCarrera>0?Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: FloatingActionButton(
              heroTag: null,
              onPressed: () {
                  setState(() {
                    indexCarrera--;
                    finish=false;
                  });
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              backgroundColor: Colors.white,
            ),
          ),
        ):Container(),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: FloatingActionButton(
              heroTag: null,
              onPressed: () {
                if(indexCarrera>=widget.habilidadesCarreras.length-1){
                  setState(() {
                    finish=true;
                  });
                }
                if(!finish){
                  setState(() {
                    indexCarrera++;
                  });
                }else{
                  setState(() {
                    saving=true;
                  });
                  for(int i=0;i<widget.habilidadesCarreras.length;i++){
                    if(widget.habilidadesCarreras[i].getFull()==false){
                      mostrarAlerta(context, "Contesta por favor", "No has calificado todas las habilidades, por favor intenta de nuevo");
                      setState(() {
                        finish=false;
                        saving=false;
                      });

                      return;
                    }
                    promediosPorCarrera[widget.habilidadesCarreras[i].getCarrera()]= widget.habilidadesCarreras[i].getPromedio();
                  }
                  try {
                    _cloud.doc(loggedUser.email) //Usuario
                        .update({
                      "cap_habilidades": promediosPorCarrera,
                    });
                    Navigator.pushReplacementNamed(
                        context, SeccionesScreen.id);
                  } catch (e) {
                    print(e);
                  }

                  setState(() {
                    saving = false;
                  });
                }
              },
              child: Icon(
                indexCarrera>=widget.habilidadesCarreras.length-1 ?Icons.check:Icons.arrow_forward_ios,
                color: Colors.black,
              ),
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

