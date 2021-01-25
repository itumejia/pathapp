import 'package:flutter/material.dart';
import 'package:pathapp/screens/capital_relaciones_screen.dart';
import 'package:pathapp/screens/capital_habilidades_screen.dart';
import 'package:pathapp/screens/prestigio_screen.dart';
import 'package:pathapp/screens/versatilidad_screen.dart';

class NavegadorRamas_screen extends StatelessWidget {

  NavegadorRamas_screen({this.carreras});

  final List<dynamic> carreras;
  static String id='nav_ramas_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Elige un test",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width*0.2,
            ),
          ),
          FlatButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => versatilidadScreen(carreras: carreras, versatilidad: true,),
                ),
                );
              },
              child: Text("Versatilidad"),
          ),
          FlatButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => versatilidadScreen(carreras: carreras, versatilidad: false,),
                  ),
                );
              },
              child: Text("Prestigio"),
          )
        ],
      ),
    );
  }
}
