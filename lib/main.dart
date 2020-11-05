import 'package:flutter/material.dart';
import 'package:pathapp/screens/capital_carrera_habilidades.dart';
import 'screens/prueba.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: CapitalHabilidadesScreen(carreras: ['ITC','IRS','TUR'],),
    );
  }
  //prueba git
}