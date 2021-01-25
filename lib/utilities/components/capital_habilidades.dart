import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'white_box_carrera.dart';

class CapitalHabilidadesWidgetLeft extends StatelessWidget {
  final String carrera;
  final TextEditingController controlador1;
  final TextEditingController controlador2;
  final TextEditingController controlador3;
  CapitalHabilidadesWidgetLeft({this.carrera, this.controlador1, this.controlador2, this.controlador3});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Columna con tres habilidades que ingresará el usuario
        Container(
          width: 200,
          child: Column(
            children: [
              CajaHabilidad(left: true, controlador: controlador1,),
              CajaHabilidad(left: true, controlador: controlador2,),
              CajaHabilidad(left: true, controlador: controlador3,),
            ],

          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.white,
            thickness: 2,
          ),
        ),
        WhiteBoxCarrera(carrera: carrera, padRight: 25,),
      ],
    );
  }
}

class CapitalHabilidadesWidgetRight extends StatelessWidget {
  final String carrera;
  final TextEditingController controlador1;
  final TextEditingController controlador2;
  final TextEditingController controlador3;
  CapitalHabilidadesWidgetRight({this.carrera, this.controlador1, this.controlador2, this.controlador3});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WhiteBoxCarrera(carrera: carrera, padLeft: 25,),
        Expanded(
          child: Divider(
            color: Colors.white,
            thickness: 2,
          ),
        ),
        Container(
          width: 200,
          child: Column(
            children: [
              CajaHabilidad(left: false, controlador: controlador1,),
              CajaHabilidad(left: false, controlador: controlador2,),
              CajaHabilidad(left: false, controlador: controlador3,),
            ],

          ),
        ),

      ],
    );
  }
}

class CajaHabilidad extends StatelessWidget {
  final bool left;
  final TextEditingController controlador;
  CajaHabilidad({@required this.left, @required this.controlador});

  @override
  Widget build(BuildContext context) {
    final double padLeft= (left ? 25: 0).toDouble();
    final double padRight= (left ? 0:25).toDouble();
    return Padding(
      padding: EdgeInsets.only(top:15.0, bottom: 15, left: padLeft,right: padRight),
      child: Container(
        height: 30,
        child: TextField(
          controller: controlador,
          decoration: InputDecoration(
            filled: false,
            border: OutlineInputBorder(
                borderRadius:BorderRadius.all(Radius.circular(50)),
                borderSide: const BorderSide(color: Colors.white, width: 1),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: const BorderSide(color: Colors.white, width: 1),),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: const BorderSide(color: Colors.white, width: 1),),
          ),
        ),
      ),
    );
  }
}

