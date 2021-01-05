import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pathapp/utilities/count_button.dart';
import 'package:pathapp/utilities/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;

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
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        email=value;
                      },
                      decoration: kInputDecoration.copyWith(hintText: 'Ingresa tu email'),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: TextField(
                      textAlign: TextAlign.center,
                      obscureText: true,
                      onChanged: (value) {
                        password=value;
                      },
                      decoration: kInputDecoration.copyWith(hintText: 'Ingresa tu contraseña'),
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  CountButton(text:'Iniciar sesión',color: Colors.lightBlueAccent,function: (){}),
                ],
              ),
            ),
          ),
        ],
      ),


    );
  }
}
