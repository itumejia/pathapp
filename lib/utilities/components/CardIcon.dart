import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardIcon extends StatelessWidget {
  CardIcon({@required this.nameImage, this.iconTitle});
  final String nameImage;
  final String iconTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            iconTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Image.asset(
              nameImage,
          )
        ],
      ),
    );
  }
}