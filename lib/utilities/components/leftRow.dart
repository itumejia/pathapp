import 'package:flutter/material.dart';

class leftRow extends StatelessWidget {
  final Widget circleCont;

  leftRow({this.circleCont});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
              height: 60,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              )
          ),
        ),
        Container(
          color: Colors.white,
          height: 1,
          width: 40,
        ),
        Container(
          color: Colors.white,
          height: 80,
          width: 1,
        ),
        Container(
          height: 1,
          width: 40,
        ),
        Expanded(
            child: circleCont
        )
      ],
    );
  }
}