import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pathapp/utilities/components/count_button.dart';
import 'package:pathapp/utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pathapp/utilities/functions/firebaseFunctions.dart';
import 'package:pathapp/utilities/components/fonts.dart';
import '../utilities/components/fonts.dart';
import '../utilities/constants.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  bool eEmail = true;
  bool ePass = true;
  bool _saving = false;

  final controllerEmail = TextEditingController();
  final controllerPass = TextEditingController();

  final _author = FirebaseAuth.instance;
  final _cloud = FirebaseFirestore.instance.collection('/usuarios');

  @override
  Widget build(BuildContext context) {
    final double widthScreenPercentage = MediaQuery.of(context).size.width;
    final double heightScreenPercentage = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kColorMorado,
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        child: ListView(shrinkWrap: true, children: <Widget>[
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: heightScreenPercentage * 0.08),
                child: SvgPicture.asset(
                  "assets/images/efectosFondo2.svg",
                  width: widthScreenPercentage,
                ),
              ),
              SafeArea(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: heightScreenPercentage * 0.12),
                        child: SvgPicture.asset(
                          "assets/images/libro.svg",
                          width: widthScreenPercentage * 0.2,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: heightScreenPercentage * 0.05,
                          ),
                          child: fontStyleMPlus(
                            text: 'INICIAR SESIÓN',
                            sizePercentage: 5,
                            color: Colors.white,
                            letterSpacing: widthScreenPercentage * (-0.005),
                          )),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: heightScreenPercentage * 0.025,
                          horizontal: widthScreenPercentage * 0.08,
                        ),
                        child: TextField(
                          controller: controllerEmail,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            email = value;
                          },
                          decoration: eEmail
                              ? kInputDecoration.copyWith(
                                  hintText: 'Correo electrónico')
                              : kInputDecorationError.copyWith(
                                  hintText: 'Correo Faltante'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: heightScreenPercentage * 0.025,
                          horizontal: widthScreenPercentage * 0.08,
                        ),
                        child: TextField(
                          controller: controllerPass,
                          textAlign: TextAlign.center,
                          obscureText: true,
                          onChanged: (value) {
                            password = value;
                          },
                          decoration: ePass
                              ? kInputDecoration.copyWith(
                                  hintText: 'Contraseña')
                              : kInputDecorationError.copyWith(
                                  hintText: 'Contraseña Faltante'),
                        ),
                      ),
                      CountButton(
                          screenHeight: heightScreenPercentage,
                          screenWidth: widthScreenPercentage,
                          text: 'Iniciar sesión',
                          color: kColorAzulEfectosFondo,
                          function: () async {
                            setState(() {
                              _saving = true;
                            });

                            eEmail = true;
                            ePass = true;

                            if (email == '') {
                              controllerEmail.clear();
                              setState(() {
                                eEmail = false;
                              });
                            }
                            if (password == '') {
                              controllerPass.clear();
                              setState(() {
                                ePass = false;
                              });
                            }

                            if (eEmail == true && ePass == true) {
                              try {
                                final user =
                                    await _author.signInWithEmailAndPassword(
                                        email: email, password: password);
                                if (user != null) {
                                  Map<String, dynamic> result =
                                      await getData(email);
                                  List<dynamic> arrayCarrera =
                                      result['carreras'];
                                  //print(result['nombres']);
                                  if (arrayCarrera.length != 0) {
                                    //ir a pantalla de carreras
                                  } else {
                                    //ir a pantalla de inicio
                                  }
                                }
                              } catch (e) {
                                print(e);
                              }
                            }

                            setState(() {
                              _saving = false;
                            });
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
