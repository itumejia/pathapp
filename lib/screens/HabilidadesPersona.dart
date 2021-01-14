import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pathapp/utilities/components/instruction_box_widget.dart';
import 'package:pathapp/utilities/constants.dart';
import 'package:pathapp/utilities/components/fieldListH.dart';
import 'package:provider/provider.dart';
import 'package:pathapp/utilities/models/field_dataH.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HabilidadesPersona extends StatefulWidget {
  static String id='cap_rating_screen';
  @override
  _HabilidadesPersonaState createState() => _HabilidadesPersonaState();
}

class _HabilidadesPersonaState extends State<HabilidadesPersona> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kColorVerdeClaro,
        body: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 30.0, bottom: 30.0, right: 20.0, left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Row(
                      children:[
                        Icon(
                          Icons.crop_square,
                          color: Colors.white,
                        ),
                        Expanded(
                            child: InstructionBoxWidget(texto: '¿Qué tan importante es cada una de estas habilidades?')),
                      ]
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  child: Text(
                    'LAET',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(15),
                  height: 60,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 8),
                        ),
                      ]
                   ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Stack(
                    overflow: Overflow.visible,
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        height: 350,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                            ),
                          ],
                        ),
                        child: ChangeNotifierProvider(
                            create: (context) => FieldDataH(),
                            child: FieldListH()
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}

