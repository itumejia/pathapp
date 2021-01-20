import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pathapp/screens/Habilidades.dart';
import 'package:pathapp/screens/HabilidadesPersona.dart';
import 'package:pathapp/screens/Secciones.dart';
import 'package:pathapp/screens/Valores.dart';
import 'package:pathapp/screens/capital_habilidades_screen.dart';
import 'package:pathapp/screens/capital_relaciones_screen.dart';
import 'package:pathapp/screens/intro_screen.dart';
import 'package:pathapp/screens/login_screen.dart';
import 'package:pathapp/screens/prestigio_screen.dart';
import 'package:pathapp/screens/register_screen.dart';
import 'package:pathapp/screens/sesion_screen.dart';
import 'package:pathapp/screens/versatilidad_screen.dart';
import 'package:pathapp/screens/areas_estudio_screen.dart';
import 'package:pathapp/screens/NavegadorCapital_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SeccionesScreen.id,
      routes: {
        //Pantallas de inicio:
        introScreen.id: (context)=>introScreen(), //Pantalla de bienvenida
        sesionScreen.id: (context)=>sesionScreen(), // Pantalla Login/ Registrarse
        LoginScreen.id: (context)=>LoginScreen(), //Pantalla de Login
        RegisterScreen.id: (context)=>RegisterScreen(), //Pantalla de Registro
        areasEstudioScreen.id: (context) => areasEstudioScreen(), //Pantalla para introducir carreras
        SeccionesScreen.id:(context)=> SeccionesScreen(), //Pantalla de menú principal, para escoger test
        //Falta pantalla de resultados

        //Ramas del conocimiento:
        //Falta navegador
        versatilidadScreen.id: (context)=>versatilidadScreen(), //Pantalla de Versatilidad
        prestigioScreen.id: (context)=>prestigioScreen(), //Pantalla de Prestigio

        //Pantallas de Impacto Social
        //Falta pantalla para añadir problemas
        //Falta pantalla para calificar impacto

        //Pantallas de Capital de Carrera
        CapitalHabilidadesScreen.id: (context)=>CapitalHabilidadesScreen(), //Pantalla para introducir qué habilidades te gustaría aprender
        HabilidadesPersona.id: (context)=>HabilidadesPersona(), //Pantalla para calificar habilidades
        CapitalRelacionesScreen.id: (context)=>CapitalRelacionesScreen(), //Pantalla para calificar relaciones por carrera

        //Pantallas de Personal Fit
        Valores.id: (context)=> Valores(), //Pantalla para introducir habilidades de la persona
        HabilidadesScreen.id: (context)=> HabilidadesScreen(), //Pantalla para calificar habilidades

        //Navegadores de test
        NavegadorCapital_screen.id: (context)=>NavegadorCapital_screen(),

      },
    );
  }
}
