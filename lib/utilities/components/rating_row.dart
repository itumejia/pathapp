import 'package:flutter/material.dart';
import 'package:pathapp/utilities/models/HabilidadesStructure.dart';

class RatingRow extends StatefulWidget {
  @override
  _RatingRowState createState() => _RatingRowState();
  final HabilidadRating habilidadPair;
  final Color colore;
  RatingRow({this.habilidadPair, this.colore});
  int rating;
}

class _RatingRowState extends State<RatingRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
        children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(8.0),
          alignment: Alignment.center,
          width: 110.0,
          height: 50.0,
          child: Text(
            widget.habilidadPair.habilidad,
            textAlign: TextAlign.center,
          ),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: widget.colore),
          ),
          ),
          Radio(
          value: 1,
          groupValue: widget.habilidadPair.getRating(),
          activeColor: widget.colore,
          onChanged: (int value){
            setState(() {
              widget.habilidadPair.setRating(value);
            });
            },
          ),
          Radio(
          value: 2,
          groupValue: widget.habilidadPair.getRating(),
          activeColor: widget.colore,
          onChanged: (int value){
            setState(() {
            widget.habilidadPair.setRating(value);
            });
            },
          ),
          Radio(
          value: 3,
          groupValue: widget.habilidadPair.getRating(),
          activeColor: widget.colore,
          onChanged: (int value){
            setState(() {
              widget.habilidadPair.setRating(value);
            });
            },
          ),
          Radio(
          value: 4,
          groupValue: widget.habilidadPair.getRating(),
          activeColor: widget.colore,
          onChanged: (int value){
            setState(() {
              widget.habilidadPair.setRating(value);
            });
            },
          ),
          Radio(
          value: 5,
          groupValue: widget.habilidadPair.getRating(),
          activeColor: widget.colore,
          onChanged: (int value){
              setState(() {
                widget.habilidadPair.setRating(value);
              });
              },
    ),
    ],
    );
  }
}
