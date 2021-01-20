import 'package:flutter/material.dart';

const kColorMorado = Color(0xFF493D73);
const kColorAzulClaro = Color(0xfb609fb3);
const kColorAzul = Color(0xFF576EF2);
const kColorAmarillo = Color(0xFFF2B84B);
const kColorNaranja = Color(0xFFF29544);
const kColorCafe = Color(0xFFBF7E78);
const kColorLila = Color(0xFFAC70A2);
const kColorLilaBrilla = Color(0xFFD988FF);
const kColorMoradotOpaco = Color(0xFF73669F);
const kColorMoradoSuave = Color(0xFF77389D);
const kColorMoradoGris = Color(0xFF5A5275);
const kColorRosa = Color(0xFFF6C2C2);
const kColorVerdeClaro = Color(0xFFC6DC72);
const kColorVerdeOscuro = Color(0xFF8BA32B);
const kColorGris = Colors.grey;
const kColorAzulEfectosFondo = Color(0xFF5C92A3);

const kInputCarreras = InputDecoration(
  hintText: 'Introduce carrera',
  fillColor: Colors.white,
  filled: true,
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 35),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

//TODO: PASARLO A COMPONENTES
Widget kCreateRect(
    BuildContext context, Widget leftWidget, Widget rightWidget) {
  return (Container(
    width: MediaQuery.of(context).size.width * 0.45,
    height: MediaQuery.of(context).size.height * 0.06,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.white,
        width: 1.0,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        leftWidget,
        Container(
          width: MediaQuery.of(context).size.width * 0.04,
        ),
        rightWidget,
      ],
    ),
  ));
}
