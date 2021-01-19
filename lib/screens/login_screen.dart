import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pathapp/utilities/components/count_button.dart';
import 'package:pathapp/utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pathapp/utilities/functions/firebaseFunctions.dart';

class LoginScreen extends StatefulWidget {
  static String id='login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  bool eEmail=true;
  bool ePass=true;
  bool _saving=false;

  final controllerEmail=TextEditingController();
  final controllerPass=TextEditingController();

  final _author=FirebaseAuth.instance;
  final _cloud=FirebaseFirestore.instance.collection('/usuarios');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff493D73),
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Stack(
              children: [
                SvgPicture.asset(
                  "assets/images/estrellas_fondo.svg",
                  width: MediaQuery.of(context).size.width,
                ),
                SafeArea(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: SvgPicture.asset(
                            "assets/images/libro.svg",
                            width: 70,
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Iniciar Sesión",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(22.0),
                          child: TextField(
                            controller: controllerEmail,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              email=value;
                            },
                            decoration: eEmail ? kInputDecoration.copyWith(hintText: 'Correo electrónico') : kInputDecorationError.copyWith(hintText: 'Correo Faltante'),
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(22.0),
                          child: TextField(
                            controller: controllerPass,
                            textAlign: TextAlign.center,
                            obscureText: true,
                            onChanged: (value) {
                              password=value;
                            },
                            decoration: ePass ? kInputDecoration.copyWith(hintText: 'Contraseña') : kInputDecorationError.copyWith(hintText: 'Contraseña Faltante'),
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        CountButton(text:'Iniciar sesión',color: Colors.lightBlueAccent,function: () async{
                          setState(() {
                            _saving=true;
                          });

                          eEmail=true;
                          ePass=true;

                          if(email==''){
                            controllerEmail.clear();
                            setState(() {
                              eEmail=false;
                            });
                          }
                          if(password==''){
                            controllerPass.clear();
                            setState(() {
                              ePass=false;
                            });
                          }

                          if(eEmail==true && ePass==true){
                            try{
                              final user = await _author.signInWithEmailAndPassword(
                                  email: email, password: password);
                              if (user != null) {
                                Map<String, dynamic> result= await getData(email);
                                List<dynamic> arrayCarrera = result['carreras'];
                                //print(result['nombres']);
                                if(arrayCarrera.length!=0){
                                  //ir a pantalla de carreras
                                }else{
                                  //ir a pantalla de inicio
                                }
                              }
                            }
                            catch(e){
                              print(e);
                            }
                          }

                          setState(() {
                            _saving=false;
                          });
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ]
        ),
      ),


    );
  }
}
