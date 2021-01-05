import 'package:flutter/material.dart';
import 'package:pathapp/utilities/white_box_carrera.dart';

class RelacionesRating extends StatefulWidget {

  final String carrera;
  RelacionesRating({this.carrera});
  int rating;

  @override
  _RelacionesRatingState createState() => _RelacionesRatingState();
}

class _RelacionesRatingState extends State<RelacionesRating> {



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WhiteBoxCarrera(carrera: widget.carrera,),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                value: 1,
                groupValue: widget.rating,
                onChanged: (int value){
                  setState(() {
                    widget.rating=value;
                  });
                },
              ),
              Radio(
                value: 2,
                groupValue: widget.rating,
                onChanged: (int value){
                  setState(() {
                    widget.rating=value;
                  });
                },
              ),
              Radio(
                value: 3,
                groupValue: widget.rating,
                onChanged: (int value){
                  setState(() {
                    widget.rating=value;
                  });
                },
              ),
              Radio(
                value: 4,
                groupValue: widget.rating,
                onChanged: (int value){
                  setState(() {
                    widget.rating=value;
                  });
                },
              ),
              Radio(
                value: 5,
                groupValue: widget.rating,
                onChanged: (int value){
                  setState(() {
                    widget.rating=value;
                  });
                },
              ),

            ],
          )
        ],
      ),
    );
  }
}
