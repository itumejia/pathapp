import 'package:flutter/material.dart';

class backButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .5,
      child: Align(
        alignment: Alignment.centerLeft,
        child: RawMaterialButton(
          onPressed: () {},
          fillColor: Colors.white,
          child: Icon(
            Icons.arrow_back,
            size: 25.0,
          ),
          elevation: 20,
          padding: EdgeInsets.all(8.0),
          shape: CircleBorder(),
        ),
      ),
    );
  }
}