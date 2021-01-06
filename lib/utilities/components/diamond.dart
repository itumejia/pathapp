import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Widget createDiamond(double size) {
  return Transform.rotate(
    angle: pi / 4,
    child: Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
    ),
  );
}
