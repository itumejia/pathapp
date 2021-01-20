import 'package:flutter/material.dart';
import 'package:pathapp/utilities/components/instruction_box_widget2.dart';
import 'package:pathapp/utilities/components/relaciones_rating.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pathapp/screens/Secciones.dart';

class CapitalRelacionesScreen extends StatefulWidget {
  static String id='cap_relaciones_screen';

  CapitalRelacionesScreen({@required this.carreras});
  List<dynamic> carreras=[];

  @override
  _CapitalRelacionesScreenState createState() => _CapitalRelacionesScreenState();
}

class _CapitalRelacionesScreenState extends State<CapitalRelacionesScreen> {

  User loggedUser;

  final _cloud=FirebaseFirestore.instance.collection('/usuarios');

  bool saving=false;

  Map<String, int> results={};

  void getCurrentUser()async{
    try{
      final author= FirebaseAuth.instance;
      loggedUser= await author.currentUser;
      if(loggedUser!=null){
        print(loggedUser.email);
      }
    }catch(e){
      print(e);
    }
  }

  List<RelacionesRating> createList(){
    List<RelacionesRating> widgets=[];
    for(int i=0; i<widget.carreras.length;i++){
      widgets.add(RelacionesRating(carrera: widget.carreras[i],));
    }
    return widgets;
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Califica por favor"),
          content: Text("No has calificado todas tus carreras, por favor intenta de nuevo"),
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
          bool completado=true;
          for(int i=0;i<RatingWidgets.length;i++){
            if(RatingWidgets[i].rating==null){
              completado=false;
              break;
            }
          }
          if(completado==false){
            _showDialog(context);
          }else{
            setState(() {
              saving=true;
            });
            for (int i = 0; i < RatingWidgets.length; i++) {
              results[RatingWidgets[i].carrera]=RatingWidgets[i].rating;
            }
            print(results);
            try {
              _cloud
                  .doc(loggedUser.email) //Usuario
                  .update({
                "cap_personas": results,
              });

              Navigator.pushNamedAndRemoveUntil(context,SeccionesScreen.id,(Route<dynamic> route) => false);
            }
            catch(e){
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
                InstructionBoxWidget(
                  texto: '¿TE SERÍA FÁCIL RELACIONARTE CON PERSONAS DE LA CARRERA?',
                  toDo: (){
                    print(RatingWidgets[0].rating);
                    print(RatingWidgets[1].rating);
                  },
                ),
                Expanded(
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
