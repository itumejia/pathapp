import 'package:flutter/material.dart';

class rightRow extends StatelessWidget {
  final Widget circleCont;
  final TextEditingController controlador;

  rightRow({this.circleCont, this.controlador});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: circleCont
        ),
        Container(
          height: 1,
          width: 40,
        ),
        Container(
          color: Colors.white,
          height: 80,
          width: 1,
        ),
        Container(
          color: Colors.white,
          height: 1,
          width: 40,
        ),
        Expanded(
          child: Container(
              height: 60,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: controlador,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              )
          ),
        ),
      ],
    );
  }
}