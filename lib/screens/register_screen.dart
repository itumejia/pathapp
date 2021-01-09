import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pathapp/utilities/components/count_button.dart';
import 'package:pathapp/utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

InputDecoration getEstiloPass2(bool completo, bool coincide){
  if(!completo){
    return kInputDecorationError.copyWith(hintText: "Confirmación Faltante");
  }
  else if(!coincide){
    return kInputDecorationError.copyWith(hintText: "No coincide");
  }
  else{
    return kInputDecoration.copyWith(hintText: 'Confirmar contraseña');
  }
}

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String nombre='';
  String apellidos='';
  String email='';
  String password='';
  String password2='';

  bool _saving=false;
  bool eNombre=true;
  bool eApellidos=true;
  bool eEmail=true;
  bool ePass=true;
  bool ePass2=true;
  bool pass2coin=true;

  bool todoChido=true;

  final controllerNombre=TextEditingController();
  final controllerApellidos=TextEditingController();
  final controllerEmail=TextEditingController();
  final controllerPass=TextEditingController();
  final controllerPass2=TextEditingController();

  final _author=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff493D73),
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        child: Stack(
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
                              controller: controllerNombre,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                nombre=value;
                              },
                              decoration: eNombre ? kInputDecoration.copyWith(hintText: 'Nombre') : kInputDecorationError.copyWith(hintText: 'Nombre Faltante'),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              controller: controllerApellidos,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                apellidos=value;
                              },
                              decoration: eApellidos ? kInputDecoration.copyWith(hintText: 'Apellidos') : kInputDecorationError.copyWith(hintText: 'Apellidos Faltantes'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
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
                          Padding(
                            padding: const EdgeInsets.all(10.0),
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
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              controller: controllerPass2,
                              textAlign: TextAlign.center,
                              obscureText: true,
                              onChanged: (value) {
                                password2=value;
                              },
                              decoration: getEstiloPass2(ePass2, pass2coin),
                            ),
                          ),
                        ],
                      ),
                    ),


                    SizedBox(
                      height: 24.0,
                    ),
                    CountButton(text:'Registrarse',color: Colors.lightBlueAccent,function: () async{
                      setState(() {
                        _saving=true;
                      });

                      todoChido=true;

                      if(nombre==''){
                        todoChido=false;
                        controllerNombre.clear();
                        setState(() {
                          eNombre=false;
                        });
                      }
                      if(apellidos==''){
                        todoChido=false;
                        controllerApellidos.clear();
                        setState(() {
                          eApellidos=false;
                        });
                      }
                      if(email==''){
                        todoChido=false;
                        controllerEmail.clear();
                        setState(() {
                          eEmail=false;
                        });
                      }
                      if(password==''){
                        todoChido=false;
                        controllerPass.clear();
                        setState(() {
                          ePass=false;
                        });
                      }
                      if(password2==''){
                        todoChido=false;
                        controllerPass2.clear();
                        setState(() {
                          ePass2=false;
                        });
                      }

                      if(password!=password2){
                        todoChido=false;
                        controllerPass2.clear();
                        setState(() {
                          pass2coin=false;
                        });
                      }




                      if(todoChido){
                        try{
                          print(email);
                          print(password);
                          final newUser=await _author.createUserWithEmailAndPassword(email: email, password: password);
                          if(newUser!=null){
                            print("Jalo chido");
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
      ),


    );
  }
}
