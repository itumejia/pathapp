import 'package:flutter/material.dart';
import 'package:pathapp/utilities/capital_habilidades.dart';
import 'package:pathapp/utilities/instruction_box_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CapitalHabilidadesScreen extends StatelessWidget {
  final List<String> carreras;
  CapitalHabilidadesScreen({this.carreras});

  List<Widget> createList(){
    List<Widget> widgets=[];
    for(int i=0; i<carreras.length;i++){
      if(i%2==0){
        widgets.add(CapitalHabilidadesWidgetLeft(carrera: carreras[i],));
      }
      else{
        widgets.add(CapitalHabilidadesWidgetRight(carrera: carreras[i],));
      }
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffC3DA67),
      body: Column(
        children: [
          SvgPicture.asset(
              "assets/images/curva_blanca.svg",
              width: MediaQuery.of(context).size.width,
          ),
          Expanded(
            child: ListView(
              children: createList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Row(
              children:[
                SvgPicture.asset(
                    "assets/images/rombo.svg",
                    //width: 20,
                ),
                Expanded(
                    child: InstructionBoxWidget(texto: '¿Qué habilidades te gustaría aprender?',))
              ]
            ),
          ),
        ]
      ),
    );
  }
}