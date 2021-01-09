import 'package:flutter/material.dart';

const kColorMorado= Color(0xFF493D73);
const kColorAzul= Color(0xFF576EF2);
const kColorAmarillo= Color(0xFFF2B84B);
const kColorNaranja= Color(0xFFF29544);
const kColorCafe= Color(0xFFBF7E78);
const kColorLila= Color(0xFFAC70A2);
const kColorLilaBrilla= Color(0xFFD988FF);
const kColorMoradotOpaco= Color(0xFF73669F);
const kColorMoradoSuave= Color(0xFF77389D);
const kColorMoradoGris= Color(0xFF5A5275);
const kColorRosa= Color(0xFFF6C2C2);
const kColorVerdeClaro= Color(0xFFC6DC72);
const kColorVerdeOscuro= Color(0xFF8BA32B);

const kInputDecoration = InputDecoration(

  hintText: 'Enter a value',
  fillColor: Colors.white,
  filled: true,
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kInputDecorationError = InputDecoration(

  hintText: 'Enter a value',
  fillColor: Colors.white,
  filled: true,
  hintStyle: TextStyle(color: Colors.red),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);