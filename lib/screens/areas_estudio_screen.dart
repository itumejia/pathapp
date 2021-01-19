import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pathapp/screens/Secciones.dart';
import 'package:pathapp/utilities/constants.dart';
import '../utilities/components/diamond.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pathapp/utilities/functions/firebaseFunctions.dart';
import 'package:pathapp/screens/sesion_screen.dart';

class areasEstudioScreen extends StatefulWidget {
  static String id='areas_estudio_screen';

  @override
  _areasEstudioScreenState createState() => _areasEstudioScreenState();
}

class _areasEstudioScreenState extends State<areasEstudioScreen> {
  User loggedUser;
  final _cloud=FirebaseFirestore.instance.collection('/usuarios');
  List<String> carrerasLimpio=[];
  bool saving=false;

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

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
  List<TextEditingController> controladores=[
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  int numCarreras=2;

  void dispose() {
    for(int i=0;i<controladores.length;i++){
      controladores[i].dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Color(0xfb493d73),
            body: ModalProgressHUD(
              inAsyncCall: saving,
              child: ListView(shrinkWrap: true, children: [
                Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/images/fondoCarrera.svg',
                      width: MediaQuery.of(context).size.width,
                    ),
                    SafeArea(
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.65,
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: ListView.builder(
                                itemCount: numCarreras,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        controller: controladores[index],
                                        decoration: kInputCarreras,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    saving=true;
                                  });

                                  for (int i = 0; i < controladores.length; i++) {
                                    if (controladores[i].text != "") {
                                      carrerasLimpio.add(controladores[i].text);
                                    }
                                  }


                                  try {
                                    _cloud
                                        .doc(loggedUser.email) //Usuario
                                        .update({
                                      "carreras": carrerasLimpio,
                                    });

                                    Navigator.pushReplacementNamed(context,SeccionesScreen.id);

                                  }
                                  catch(e){
                                    print(e);
                                  }

                                  setState(() {
                                    saving=true;
                                  });

                                },
                                child: kCreateRect(
                                  context,
                                  createDiamond(22),
                                  Text(
                                    'CONTINUAR',
                                    style: GoogleFonts.amaranth(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 3.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    '\nAGREGA TUS\nCARRERAS',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.amaranth(
                                        color: Colors.white,
                                        fontSize: 28.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 3.0),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
                    ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: FloatingActionButton(
              heroTag: null,
              onPressed: () {
                if(numCarreras>2){
                  setState(() {
                    numCarreras--;
                  });
                  controladores[numCarreras].clear();
                }
              },
              child: Icon(
                Icons.remove,
                color: Colors.black,
              ),
              backgroundColor: Colors.white,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: FloatingActionButton(
              heroTag: null,
              onPressed: () {
                if(numCarreras<4){
                  setState(() {
                    numCarreras++;
                  });
                }
              },
              child: Icon(
                Icons.add,
                color: Colors.black,
              ),
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ]
    );
  }
}
