import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pathapp/screens/areas_estudio_screen.dart';
import 'package:pathapp/utilities/components/count_button.dart';
import 'package:pathapp/utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pathapp/utilities/components/fonts.dart';
import 'package:pathapp/utilities/components/textFieldDecoration.dart';
import '../utilities/constants.dart';

class RegisterScreen extends StatefulWidget {
  static String id = 'register_screen';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String nombre = '';
  String apellidos = '';
  String email = '';
  String password = '';
  String password2 = '';

  bool _saving = false;

  bool eNombre = true;
  bool eApellidos = true;
  bool eEmail = true;
  bool ePass = true;
  bool ePass2 = true;
  bool pass2coin = true;

  bool todoChido = true;

  final controllerNombre = TextEditingController();
  final controllerApellidos = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPass = TextEditingController();
  final controllerPass2 = TextEditingController();

  final _author = FirebaseAuth.instance;
  final _cloud = FirebaseFirestore.instance.collection('/usuarios');

  @override
  Widget build(BuildContext context) {
    final double widthScreenPercentage = MediaQuery.of(context).size.width;
    final double heightScreenPercentage = MediaQuery.of(context).size.height;
    InputDecoration getEstiloPass2(bool completo, bool coincide) {
      if (!completo) {
        return textFieldDecoration("Confirmación faltante",
            widthScreenPercentage, heightScreenPercentage, Colors.red);
      } else if (!coincide) {
        return textFieldDecoration("No coincide", widthScreenPercentage,
            heightScreenPercentage, Colors.red);
      } else {
        return textFieldDecoration("Confirmar contraseña",
            widthScreenPercentage, heightScreenPercentage, Colors.grey);
      }
    }

    return Scaffold(
      backgroundColor: kColorMorado,
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        child: ListView(children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: heightScreenPercentage * 0.05),
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
                            EdgeInsets.only(top: heightScreenPercentage * 0.09),
                        child: SvgPicture.asset(
                          "assets/images/libro.svg",
                          width: widthScreenPercentage * 0.2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: heightScreenPercentage * 0.02),
                        child: fontStyleMPlus(
                          text: 'REGÍSTRATE',
                          sizePercentage: 5,
                          color: Colors.white,
                          letterSpacing: widthScreenPercentage * (-0.005),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: heightScreenPercentage * 0.013,
                          horizontal: widthScreenPercentage * 0.08,
                        ),
                        child: Container(
                          height: heightScreenPercentage * 0.06,
                          width: widthScreenPercentage * 0.8,
                          child: TextField(
                            controller: controllerNombre,
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              nombre = value;
                            },
                            decoration: eNombre
                                ? textFieldDecoration(
                                    "Nombre",
                                    widthScreenPercentage,
                                    heightScreenPercentage,
                                    Colors.grey)
                                : textFieldDecoration(
                                    "Nombre faltante",
                                    widthScreenPercentage,
                                    heightScreenPercentage,
                                    Colors.red),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: heightScreenPercentage * 0.013,
                          horizontal: widthScreenPercentage * 0.08,
                        ),
                        child: Container(
                          height: heightScreenPercentage * 0.06,
                          width: widthScreenPercentage * 0.8,
                          child: TextField(
                            controller: controllerApellidos,
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              apellidos = value;
                            },
                            decoration: eApellidos
                                ? textFieldDecoration(
                                    "Apellidos",
                                    widthScreenPercentage,
                                    heightScreenPercentage,
                                    Colors.grey)
                                : textFieldDecoration(
                                    "Apellidos faltante",
                                    widthScreenPercentage,
                                    heightScreenPercentage,
                                    Colors.red),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: heightScreenPercentage * 0.013,
                          horizontal: widthScreenPercentage * 0.08,
                        ),
                        child: Container(
                          height: heightScreenPercentage * 0.06,
                          width: widthScreenPercentage * 0.8,
                          child: TextField(
                            controller: controllerEmail,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              email = value;
                            },
                            decoration: eEmail
                                ? textFieldDecoration(
                                    "Correo electrónico",
                                    widthScreenPercentage,
                                    heightScreenPercentage,
                                    Colors.grey)
                                : textFieldDecoration(
                                    "Correo faltante",
                                    widthScreenPercentage,
                                    heightScreenPercentage,
                                    Colors.red),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: heightScreenPercentage * 0.013,
                          horizontal: widthScreenPercentage * 0.08,
                        ),
                        child: Container(
                          height: heightScreenPercentage * 0.06,
                          width: widthScreenPercentage * 0.8,
                          child: TextField(
                            controller: controllerPass,
                            textAlign: TextAlign.center,
                            obscureText: true,
                            onChanged: (value) {
                              password = value;
                            },
                            decoration: ePass
                                ? textFieldDecoration(
                                    "Contraseña",
                                    widthScreenPercentage,
                                    heightScreenPercentage,
                                    Colors.grey)
                                : textFieldDecoration(
                                    "Contraseña faltante",
                                    widthScreenPercentage,
                                    heightScreenPercentage,
                                    Colors.red),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: heightScreenPercentage * 0.013,
                          horizontal: widthScreenPercentage * 0.08,
                        ),
                        child: Container(
                          height: heightScreenPercentage * 0.06,
                          width: widthScreenPercentage * 0.8,
                          child: TextField(
                            controller: controllerPass2,
                            textAlign: TextAlign.center,
                            obscureText: true,
                            onChanged: (value) {
                              password2 = value;
                            },
                            decoration: getEstiloPass2(ePass2, pass2coin),
                          ),
                        ),
                      ),
                      CountButton(
                          screenWidth: widthScreenPercentage,
                          screenHeight: heightScreenPercentage,
                          text: 'Registrarse',
                          color: kColorAzulEfectosFondo,
                          function: () async {
                            setState(() {
                              _saving = true;
                            });

                            todoChido = true;
                            eNombre = true;
                            eApellidos = true;
                            eEmail = true;
                            ePass = true;
                            ePass2 = true;
                            pass2coin = true;

                            if (nombre == '') {
                              todoChido = false;
                              controllerNombre.clear();
                              setState(() {
                                eNombre = false;
                              });
                            }
                            if (apellidos == '') {
                              todoChido = false;
                              controllerApellidos.clear();
                              setState(() {
                                eApellidos = false;
                              });
                            }
                            if (email == '') {
                              todoChido = false;
                              controllerEmail.clear();
                              setState(() {
                                eEmail = false;
                              });
                            }
                            if (password == '') {
                              todoChido = false;
                              controllerPass.clear();
                              setState(() {
                                ePass = false;
                              });
                            }
                            if (password2 == '') {
                              todoChido = false;
                              controllerPass2.clear();
                              setState(() {
                                ePass2 = false;
                              });
                            }

                            if (password != password2) {
                              todoChido = false;
                              controllerPass2.clear();
                              setState(() {
                                pass2coin = false;
                              });
                            }

                            if (todoChido) {
                              try {
                                print(email);
                                print(password);
                                final newUser = await _author
                                    .createUserWithEmailAndPassword(
                                        email: email, password: password);
                                if (newUser != null) {
                                  await _cloud.doc(email).set({
                                    "nombres": nombre,
                                    "apellidos": apellidos,
                                    "carreras": [],
                                    "versatilidad": {},
                                    "prestigio": {},
                                    "imp_social": {},
                                    "cap_habilidades": {},
                                    "cap_personas": {},
                                    "personal_fit": {}
                                  });
                                  Navigator.pushReplacementNamed(
                                      context,
                                      areasEstudioScreen
                                          .id); //Cambiar a Introducir Carreras
                                  print("Jalo chido");
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
