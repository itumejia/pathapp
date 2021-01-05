import 'package:flutter/material.dart';

class WhiteBoxCarrera extends StatelessWidget {

  final String carrera;
  final double padLeft;
  final double padRight;

  WhiteBoxCarrera({this.carrera,this.padLeft=0,this.padRight=0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: padLeft,right: padRight),
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: Container(
          //width: 140,
          //alignment: Alignment.center,
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
    );
  }
}