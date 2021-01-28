import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pathapp/utilities/components/backButton.dart';
import 'package:pathapp/utilities/components/dragContainer.dart';
import 'package:pathapp/utilities/components/dragTarget.dart';
import 'package:pathapp/utilities/functions/alerta.dart';
import 'package:provider/provider.dart';
import 'package:pathapp/utilities/models/versatilidad_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pathapp/screens/Secciones.dart';
import 'package:pathapp/screens/sesion_screen.dart';

class versatilidadScreen extends StatefulWidget {
  versatilidadScreen({@required this.carreras, @required this.versatilidad});
  List<dynamic> carreras;
  bool versatilidad;

  static String id='ramas_versatilidad_screen';


  @override
  _versatilidadScreenState createState() => _versatilidadScreenState();
}

class _versatilidadScreenState extends State<versatilidadScreen> {

  List<int> calificaciones=[100,80,50,0];

  User loggedUser;
  final _cloud=FirebaseFirestore.instance.collection('/usuarios');
  bool saving=false;
  Map<String, int> results={};

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
    Provider.of<VersatilidadData>(context,listen: false).setProv(widget.carreras.length);
    getCurrentUser();
  }

  Row targets(){
    int counter=-1;
    int rowCounter=0;
    List columns=[];
    print(widget.carreras.length);
    for(int i=0; i<widget.carreras.length; i++) {
      if (i % 2 == 0) {
        counter++;
        columns.add([
          DragTargetCarrera(numPrestigio: i+1,)
        ]);
      }
      else {
        columns[counter].add(
            DragTargetCarrera(numPrestigio: i+1,)
        );
      }
    }

      List<Widget> columnsFinal=[];
      for(int i=0;i<columns.length;i++){
        columnsFinal.add(
          Column(children: columns[i],)
        );
      }
      return Row(children: columnsFinal,);
  }

  Row contCarreras(){
    int counter=-1;
    int rowCounter=0;
    List columns=[];
    for(int i=0; i<widget.carreras.length; i++) {
      if (i % 2 == 0) {
        counter++;
        columns.add([
          dragContainer(carrera: widget.carreras[i]),
        ]);
      }
      else {
        columns[counter].add(
          dragContainer(carrera: widget.carreras[i]),
        );
      }
    }

    List<Widget> columnsFinal=[];
    for(int i=0;i<columns.length;i++){
      columnsFinal.add(
          Column(children: columns[i],)
      );
    }
    return Row(children: columnsFinal,);
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check, color: Colors.white,),
        backgroundColor: Colors.black,
        onPressed: (){
          if(Provider.of<VersatilidadData>(context,listen: false).getFinalValues.contains("")){
            //Tarea incompleta
            mostrarAlerta(context, "Tarea no terminada", "Arrastra cada una de las carreras en cada espacio en orden");
          }
          else{
            setState(() {
              saving=true;
            });

            for(int i=0;i<widget.carreras.length;i++){
              results[Provider.of<VersatilidadData>(context,listen: false).getFinalValues[i]]=calificaciones[i];
            }

            print(results);

            try {


              widget.versatilidad
                  ? _cloud.doc(loggedUser.email).update({"versatilidad": results,})
              : _cloud.doc(loggedUser.email).update({"prestigio": results,});

              Navigator.pushNamedAndRemoveUntil(context,SeccionesScreen.id,(Route<dynamic> route) => false);
            }
            catch(e){
              mostrarAlerta(context, "No se pudieron subir los datos", e);
            }

            setState(() {
              saving=false;
            });

          }

          //print(Provider.of<VersatilidadData>(context,listen: false).getFinalValues);
        },
      ),
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: saving,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset(
                'assets/images/versatilidad.svg',
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Container(
                  width: MediaQuery.of(context).size.width * .70,
                  height: MediaQuery.of(context).size.height * 0.17,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 8,
                        blurRadius: 7,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            'Descripción',
                            style: GoogleFonts.mPlusRounded1c(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: Text(
                            widget.versatilidad ? 'VERSATILIDAD' : 'PRESTIGIO',
                            style: GoogleFonts.mPlusRounded1c(
                              color: Color(0xfbAD935F),
                              fontSize: 35,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  targets(),
                  contCarreras(),
                  FlatButton(
                    child: Text('RESET'),
                    onPressed: (){
                      Provider.of<VersatilidadData>(context,listen: false).reset();
                      setState(() {});
                    },
                  )
                ],
              ),
                //Row(
                // children: [
                //   Column(
                //     children: [
                //       backButton(),
                //       groupContainers(1),
                //       groupContainers(2),
                //       Padding(
                //         padding: const EdgeInsets.symmetric(vertical: 10.0),
                //         child: dragContainers(carrerasContainers('ITC')),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.symmetric(vertical: 10.0),
                //         child: dragContainers(carrerasContainers('LAEFT')),
                //       ),
                //     ],
                //   ),
                //   Column(
                //     children: [
                //       groupContainers(3),
                //       groupContainers(4),
                //       Padding(
                //         padding: const EdgeInsets.only(top: 60.0),
                //         child: dragContainers(carrerasContainers('LCPF')),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.symmetric(vertical: 20.0),
                //         child: dragContainers(carrerasContainers('IRS')),
                //       ),
                //     ],
                //   )
                // ],
              //),
            ),
          ],
        ),
      ),
    );
  }
}







