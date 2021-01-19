import 'package:flutter/material.dart';
import 'package:pathapp/screens/capital_relaciones_screen.dart';
import 'package:pathapp/screens/capital_habilidades_screen.dart';

class NavegadorCapital_screen extends StatelessWidget {

  static String id='nav_capital_screen';

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
          ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => CapitalRelacionesScreen(carreras: ['ITC','IRS']),
                ),
                );
              },
              child: Text("Capital de personas"),
          ),
          ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CapitalRelacionesScreen(),
                  ),
                );
              },
              child: Text("Capital de habilidades"),
          )
        ],
      ),
    );
  }
}
