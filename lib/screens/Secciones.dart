import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pathapp/screens/Valores.dart';
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
import 'package:pathapp/screens/NavegadorRamas_screen.dart';

class SeccionesScreen extends StatefulWidget {
  static String id='menu_screen';
  @override
  _SeccionesScreenState createState() => _SeccionesScreenState();
}

class _SeccionesScreenState extends State<SeccionesScreen> {
  User loggedUser;
  double progreso=0.0;
  final _cloud=FirebaseFirestore.instance.collection('/usuarios');
  bool saving=false;

  List<dynamic> carreras;
  //Indicadores de tests completados
  bool ramas=false, impacto=false, capital=false, personal =false;

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

  void getInfo()async{
    Map info= await getData(loggedUser.email);
    print('getting data');

    carreras=info['carreras'];

    if(info['versatilidad'].length!=0 || info['prestigio'].length!=0){
      progreso+=16.5;
      if(info['versatilidad'].length!=0 && info['prestigio'].length!=0) {
        progreso+=16.5;
        ramas = true;
      }
    }


    if(info['imp_social'].length!=0){
      impacto=true;
      progreso+=16.5;
    }

    if(info['cap_habilidades'].length!=0 || info['cap_personas'].length!=0){
      progreso+=16.5;
      if(info['cap_habilidades'].length!=0 && info['cap_personas'].length!=0) {
        progreso+=16.5;
        capital = true;
      }
    }

    if(info['personal_fit'].length!=0){
      personal=true;
      progreso+=17;
    }

    print(ramas);
    print(impacto);
    print(capital);
    print(personal);

  }

  void update()async{
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
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.menu,
          color: kColorMorado,
        )
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 60.0, bottom: 30.0, right: 25.0, left: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Continúa tu aventura...',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        LinearPercentIndicator(
                          alignment: MainAxisAlignment.end,
                          width: MediaQuery.of(context).size.width - 200,
                          animation: true,
                          lineHeight: 20.0,
                          animationDuration: 1000,
                          percent: progreso/100,
                          center: Text("${progreso}%"),
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          progressColor: Colors.white,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Opacity(
                          opacity: progreso==100 ? 100:0,
                          child: RoundedButton(
                            titleText: 'VER RESULTADOS',
                            colorProperty: Colors.white,
                            onPressedFunction: (){
                              //Condición para saber si el progreso ya está en 100
                              if(progreso==100){
                                //Navegar a pantalla de resultados


                              }

                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      color: kColorMorado,
                      borderRadius: BorderRadius.circular(10.0),
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
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colore: ramas ? kColorGris : kColorAzul,
                      tapFunction: ()=>{
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:(context)=>NavegadorRamas_screen(carreras:carreras),
                      ),

                      )
                      }, //Ir a navegador de ramas
                      cardChild: CardIcon(
                        nameImage: 'assets/images/light-bulb.png',
                        iconTitle: 'Ramas del conocimiento',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colore:  impacto ? kColorGris : kColorAmarillo,
                      tapFunction: ()=>{}, //Ir a test de problemas del mundo
                      cardChild: CardIcon(
                        nameImage: 'assets/images/world-map.png',
                        iconTitle: 'Problemas del mundo',
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colore:  capital ? kColorGris : kColorNaranja,
                      tapFunction: (){Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NavegadorCapital_screen(carreras: carreras),
                        ),
                      );
                      },//Ir a navegador de capital
                      cardChild: CardIcon(
                        nameImage: 'assets/images/treasure.png',
                        iconTitle: 'Capital de carrera',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colore:  personal ? kColorGris : kColorCafe,
                      tapFunction: ()=>Navigator.pushNamed(context, Valores.id),
                      cardChild: CardIcon(
                        nameImage: 'assets/images/paper-plane.png',
                        iconTitle: 'Personal fit',
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
