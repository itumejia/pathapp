import 'package:flutter/material.dart';
import 'package:pathapp/utilities/components/Cuadro.dart';

class Pantalla extends StatelessWidget {
  List<String> selecciones;
  final List<String> carreras;
  Pantalla({this.carreras});

  List<Widget> lista(int condicion){
    List<Widget> fila = [];
    if(condicion == 1){
      for(int i=0;i<2;i++){
        if(i == 1){
          fila.add(Cuadro(carrera: carreras[i], margen: 45.0, width: 135, height: 170)); //170 135
        }
        else{
          fila.add(Cuadro(carrera: carreras[i], margen: 0.0, width: 115, height: 150));
        }
      }
    }
    else{
      for(int j=2;j<4;j++){
        if(j == 3){
          fila.add(Cuadro(carrera: carreras[j], margen: 45.0, width: 115, height: 150));
        }
        else{
          fila.add(Cuadro(carrera: carreras[j], margen: 10.0, width: 135, height: 170));
        }
      }
    }
    return fila;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset('assets/images/Vector 12.png'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: lista(1),
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: lista(2),
        ),
        SizedBox(
          height: 60.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Image.asset('assets/images/seleccion.png'),
        ),
      ],
    );
  }
}
