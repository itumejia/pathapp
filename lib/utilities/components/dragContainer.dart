import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pathapp/utilities/models/versatilidad_data.dart';

class dragContainer extends StatelessWidget {

  dragContainer({this.carrera});
  final carrera;



  @override
  Widget build(BuildContext context) {

    bool checkIfUsed(String carrera){
      print('executing');
      List<String> used=Provider.of<VersatilidadData>(context).getFinalValues;
      return used.contains(carrera);
    }


    return checkIfUsed(carrera) ?
      Container()
        : Container(
      width: MediaQuery.of(context).size.width * .38,
      height: MediaQuery.of(context).size.height * .085,
      child: Draggable<String>(
        data: carrera,
        feedback: carreraContainer(carrera: carrera),
        child: carreraContainer(carrera: carrera),
        childWhenDragging: Container(),
      ),
    );
  }
}

class carreraContainer extends StatelessWidget {

  carreraContainer({this.carrera});
  final String carrera;

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.center,
      child: Container(
      padding: EdgeInsets.all(6),
      width: MediaQuery.of(context).size.width * .38,
      height: MediaQuery.of(context).size.height * .085,
      child: Center(
        child: Text(
          '$carrera',
          style: GoogleFonts.mPlusRounded1c(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 8,
            blurRadius: 7,
          ),
        ],
      ),
    )
    );
  }
}