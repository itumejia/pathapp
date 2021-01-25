import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pathapp/utilities/models/versatilidad_data.dart';
import 'package:provider/provider.dart';
import 'dragContainer.dart';


class DragTargetCarrera extends StatefulWidget {

  DragTargetCarrera({this.numPrestigio});
  final int numPrestigio;

  @override
  _DragTargetCarreraState createState() => _DragTargetCarreraState();
}

class _DragTargetCarreraState extends State<DragTargetCarrera> {
  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      onWillAccept: (data){
        if(!Provider.of<VersatilidadData>(context,listen: false).getAccepted[widget.numPrestigio-1]) {
          return true;
        }
        return false;
      },
      onAccept: (data){
        Provider.of<VersatilidadData>(context,listen: false).addCarrera(widget.numPrestigio-1, data);
      },
      builder: (context, List<dynamic> candidateData, rejectedData){
        return Provider.of<VersatilidadData>(context,listen: false).getAccepted[widget.numPrestigio-1]
            ? filledTarget(numPrestigio: widget.numPrestigio,carrera: Provider.of<VersatilidadData>(context,listen: false).getFinalValues[widget.numPrestigio-1],)
            : emptyTarget(numPrestigio: widget.numPrestigio,);
      },
    );;
  }
}

class emptyTarget extends StatelessWidget {

  emptyTarget({this.numPrestigio});

  int numPrestigio;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .5,
      height: MediaQuery.of(context).size.height * .17,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(12),
              padding: EdgeInsets.all(6),
              dashPattern: [10, 6],
              strokeWidth: 2,
              child: Container(
                width: MediaQuery.of(context).size.width * .38,
                height: MediaQuery.of(context).size.height * .085,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              width: MediaQuery.of(context).size.width * .09,
              height: MediaQuery.of(context).size.height * .09,
              child: Center(
                child: Text(
                  '$numPrestigio',
                  style: GoogleFonts.mPlusRounded1c(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xffe7ca8f),
                shape: BoxShape.circle,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class filledTarget extends StatelessWidget {

  filledTarget({this.numPrestigio,this.carrera});
  int numPrestigio;
  String carrera;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .5,
      height: MediaQuery.of(context).size.height * .17,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(12),
              padding: EdgeInsets.all(6),
              dashPattern: [10, 6],
              strokeWidth: 2,
              child: Container(
                //child: accepted[numPrestigio-1] ? Text() : Container();
                width: MediaQuery.of(context).size.width * .38,
                height: MediaQuery.of(context).size.height * .085,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              width: MediaQuery.of(context).size.width * .09,
              height: MediaQuery.of(context).size.height * .09,
              child: Center(
                child: Text(
                  '$numPrestigio',
                  style: GoogleFonts.mPlusRounded1c(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xffe7ca8f),
                shape: BoxShape.circle,
              ),
            ),
          ),
          carreraContainer(carrera: carrera,),

        ],
      ),
    );
  }
}
