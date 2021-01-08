import 'package:flutter/material.dart';
import 'package:pathapp/screens/Habilidades.dart';
import 'package:pathapp/screens/Secciones.dart';
import 'package:pathapp/screens/HabilidadesPersona.dart';
import 'package:pathapp/screens/Valores.dart';
import 'package:pathapp/screens/capital_habilidades_screen.dart';
import 'package:pathapp/screens/capital_relaciones_screen.dart';
import 'package:pathapp/screens/intro_screen.dart';
import 'screens/prueba.dart';
import 'package:pathapp/screens/login_screen.dart';
import 'package:pathapp/screens/register_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pathapp/screens/sesion_screen.dart';
import 'package:pathapp/screens/prestigio_screen.dart';
import 'package:pathapp/screens/versatilidad_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: prestigioScreen(),
    );
  }
  //prueba git
}
