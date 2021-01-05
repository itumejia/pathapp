import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pathapp/utilities/count_button.dart';
import 'package:pathapp/utilities/constants.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String nombre;
  String apellidos;
  String email;
  String password;
  String password2;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff493D73),
      body: Stack(
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
                    height: 0.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Registro",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),

                  Expanded(
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextField(
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              nombre=value;
                            },
                            decoration: kInputDecoration.copyWith(hintText: 'Nombre'),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextField(
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              apellidos=value;
                            },
                            decoration: kInputDecoration.copyWith(hintText: 'Apellidos'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              email=value;
                            },
                            decoration: kInputDecoration.copyWith(hintText: 'Correo electrónico'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextField(
                            textAlign: TextAlign.center,
                            obscureText: true,
                            onChanged: (value) {
                              password=value;
                            },
                            decoration: kInputDecoration.copyWith(hintText: 'Contraseña'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextField(
                            textAlign: TextAlign.center,
                            obscureText: true,
                            onChanged: (value) {
                              password2=value;
                            },
                            decoration: kInputDecoration.copyWith(hintText: 'Confirmar contraseña'),
                          ),
                        ),
                      ],
                    ),
                  ),


                  SizedBox(
                    height: 24.0,
                  ),
                  CountButton(text:'Registrarse',color: Colors.lightBlueAccent,function: (){}),
                ],
              ),
            ),
          ),
        ],
      ),


    );
  }
}
