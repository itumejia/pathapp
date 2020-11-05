import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CapitalHabilidadesWidgetLeft extends StatelessWidget {
  final String carrera;

  CapitalHabilidadesWidgetLeft({this.carrera});

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
              CajaHabilidad(left: true),
              CajaHabilidad(left: true),
              CajaHabilidad(left: true),
            ],

          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.white,
            thickness: 2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: Material(
            elevation: 20,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 25,horizontal: 55),
              child: Text(
                  carrera,
                  style: TextStyle(fontWeight: FontWeight.w700),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.white,
              ),

            ),
          ),
        )
      ],
    );
  }
}

class CapitalHabilidadesWidgetRight extends StatelessWidget {
  final String carrera;

  CapitalHabilidadesWidgetRight({this.carrera});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Material(
            elevation: 20,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 25,horizontal: 55),
              child: Text(
                carrera,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.white,
              ),

            ),
          ),
        ),
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
              CajaHabilidad(left: false,),
              CajaHabilidad(left: false),
              CajaHabilidad(left: false),
            ],

          ),
        ),

      ],
    );
  }
}


class CajaHabilidad extends StatelessWidget {
  final bool left;
  CajaHabilidad({@required this.left});

  @override
  Widget build(BuildContext context) {
    final double padLeft= (left ? 25: 0).toDouble();
    final double padRight= (left ? 0:25).toDouble();
    return Padding(
      padding: EdgeInsets.only(top:15.0, bottom: 15, left: padLeft,right: padRight),
      child: Container(
        height: 30,
        child: TextField(
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

