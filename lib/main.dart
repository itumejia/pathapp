import 'package:flutter/material.dart';
import 'package:pathapp/screens/Habilidades.dart';
import 'package:pathapp/screens/Secciones.dart';
import 'package:pathapp/screens/HabilidadesPersona.dart';
import 'package:pathapp/screens/Valores.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Valores(),
    );
  }
}