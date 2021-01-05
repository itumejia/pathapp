import 'package:flutter/material.dart';
import 'package:pathapp/screens/capital_habilidades_screen.dart';
import 'package:pathapp/screens/capital_relaciones_screen.dart';
import 'screens/prueba.dart';
import 'package:pathapp/screens/login_screen.dart';
import 'package:pathapp/screens/register_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: LoginScreen(),
    );
  }
  //prueba git
}