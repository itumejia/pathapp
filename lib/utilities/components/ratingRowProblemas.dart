import 'package:flutter/material.dart';
import 'package:pathapp/utilities/models/ProblemasStructure.dart';

//Row que contiene la carrera calificada y 5 radio buttons

class RatingRowProblemas extends StatefulWidget {
  @override
  _RatingRowProblemasState createState() => _RatingRowProblemasState();
  final CarreraRating carreraPair; //Objeto con una carrera y su puntaje
  final Color colore;
  RatingRowProblemas({this.carreraPair, this.colore});
  int rating;
}

class _RatingRowProblemasState extends State<RatingRowProblemas> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(8.0),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width*0.2,
          height: 50.0,
          child: Text(
            widget.carreraPair.carrera,
            textAlign: TextAlign.center,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: widget.colore),
          ),
        ),
        Radio(
          value: 1,
          groupValue: widget.carreraPair.getRating(),
          activeColor: widget.colore,
          onChanged: (int value){
            setState(() {
              widget.carreraPair.setRating(value);
            });
          },
        ),
        Radio(
          value: 2,
          groupValue: widget.carreraPair.getRating(),
          activeColor: widget.colore,
          onChanged: (int value){
            setState(() {
              widget.carreraPair.setRating(value);
            });
          },
        ),
        Radio(
          value: 3,
          groupValue: widget.carreraPair.getRating(),
          activeColor: widget.colore,
          onChanged: (int value){
            setState(() {
              widget.carreraPair.setRating(value);
            });
          },
        ),
        Radio(
          value: 4,
          groupValue: widget.carreraPair.getRating(),
          activeColor: widget.colore,
          onChanged: (int value){
            setState(() {
              widget.carreraPair.setRating(value);
            });
          },
        ),
        Radio(
          value: 5,
          groupValue: widget.carreraPair.getRating(),
          activeColor: widget.colore,
          onChanged: (int value){
            setState(() {
              widget.carreraPair.setRating(value);
            });
          },
        ),
      ],
    );
  }
}