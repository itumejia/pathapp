import 'package:flutter/material.dart';
import 'package:pathapp/utilities/instruction_box_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pathapp/utilities/relaciones_rating.dart';
import 'package:pathapp/utilities/white_box_carrera.dart';

class CapitalRelacionesScreen extends StatelessWidget {
  final List<String> carreras;
  CapitalRelacionesScreen({this.carreras});

  List<RelacionesRating> createList(){
    List<RelacionesRating> widgets=[];
    for(int i=0; i<carreras.length;i++){
      widgets.add(RelacionesRating(carrera: carreras[i],));
    }
    return widgets;
  }


  @override
  Widget build(BuildContext context) {
    final List<RelacionesRating> RatingWidgets=createList();
    return Scaffold(
      backgroundColor: Color(0xffC3DA67),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InstructionBoxWidget(
                texto: '¿TE SERÍA FÁCIL RELACIONARTE CON PERSONAS DE LA CARRERA?',
                toDo: (){
                  print(RatingWidgets[0].rating);
                  print(RatingWidgets[1].rating);
                },
              ),
              Expanded(
                child: ListView(
                  children: RatingWidgets,
                ),
              ),
              Image.asset(
                "assets/images/circulo_arboles.png",
                width: MediaQuery.of(context).size.width,
              ),
            ]
        ),
      ),
    );
  }
}
