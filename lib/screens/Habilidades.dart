import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pathapp/utilities/constants.dart';
import 'package:pathapp/utilities/components/fieldList.dart';
import 'package:pathapp/utilities/models/HabilidadesStructure.dart';
import 'package:provider/provider.dart';
import 'package:pathapp/utilities/models/field_data.dart';
import 'package:pathapp/utilities/components/rating_row.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pathapp/screens/sesion_screen.dart';
import 'package:pathapp/screens/Secciones.dart';

class HabilidadesScreen extends StatefulWidget {
  static String id='personal_rating_screen';

  HabilidadesScreen({this.habilidadesCarreras});
  List<HabilidadesPorCarrera> habilidadesCarreras;

  @override
  _HabilidadesScreenState createState() => _HabilidadesScreenState();
}

class _HabilidadesScreenState extends State<HabilidadesScreen> {

  int indexCarrera=0;
  bool finish=false;
  bool saving=false;

  User loggedUser;
  final _cloud=FirebaseFirestore.instance.collection('/usuarios');
  Map<String, double> promediosPorCarrera={};
  void getCurrentUser()async{
    try{
      final author= FirebaseAuth.instance;
      loggedUser= await author.currentUser;
      if(loggedUser!=null){
        print(loggedUser.email);
      }
      else{
        Navigator.pushReplacementNamed(context,sesionScreen.id);
      }
    }catch(e){
      print(e);
    }
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Contesta por favor"),
          content: Text(
              "No has calificado todas las habilidades, por favor intenta de nuevo"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
      children: [
        Scaffold(
          floatingActionButton: Container(
            margin: EdgeInsets.only(top: 10.0),
            child: FloatingActionButton(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.arrow_back,
                  color: kColorRosa,
                  size: 30,
                ),
                onPressed: () {},
              ),
          ),
            floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          backgroundColor: kColorMorado,
          body: ModalProgressHUD(
            inAsyncCall: saving,
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(top: 30.0, bottom: 30.0, right: 20.0, left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          child: Image.asset('assets/images/player.png'),
                          width: 140.0,
                          height: 140.0,
                          margin: EdgeInsets.only(bottom: 5.0),
                          decoration: BoxDecoration(
                            color: kColorMoradoGris,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Stack(
                        overflow: Overflow.visible,
                        alignment: Alignment.center,
                        children: <Widget>[
                            Container(
                              height: 350,
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
                                  RatingRow(habilidadPair: widget.habilidadesCarreras[indexCarrera].getHabilidad(2), colore: kColorLila,),
                                  RatingRow(habilidadPair: widget.habilidadesCarreras[indexCarrera].getHabilidad(3), colore: kColorLila,),
                                  RatingRow(habilidadPair: widget.habilidadesCarreras[indexCarrera].getHabilidad(4), colore: kColorLila,)
                                ],
                              ),
                          ),
                          Positioned(
                            bottom: -40,
                            child: Container(
                              child: Text(
                                widget.habilidadesCarreras[indexCarrera].getCarrera(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              margin: EdgeInsets.all(10),
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
                          )
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Enlista 5 de tus mejores habilidades. Y puntua del 1 al 5 qué tanto se relacionan con la carrera en cuestión",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        )
                      ),
                    )
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
                    widget.habilidadesCarreras[indexCarrera].printHabCar();
                  });
                }else{
                  setState(() {
                    saving=true;
                  });
                  for(int i=0;i<widget.habilidadesCarreras.length;i++){
                    if(widget.habilidadesCarreras[i].getFull()==false){
                      _showDialog(context);
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
                      "personal_fit": promediosPorCarrera,
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


