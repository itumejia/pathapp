import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pathapp/utilities/constants.dart';
import 'package:pathapp/utilities/components/leftRow.dart';
import 'package:pathapp/utilities/components/rigthRow.dart';

class Valores extends StatefulWidget {
  @override
  _ValoresState createState() => _ValoresState();
}

class _ValoresState extends State<Valores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorMorado,
      floatingActionButton: Container(
        margin: EdgeInsets.only(top: 10.0),
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.arrow_back,
            color: kColorRosa,
            size: 30,
          ),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Container(
        child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget> [
          Padding(
            padding: EdgeInsets.only(top: 30.0, bottom: 30.0, right: 20.0, left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                rightRow(circleCont:
                  Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment(0.7,-1),
                      child: SizedBox(
                        width: 20.0,
                        height: 20.0,
                        child: Container(
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: kColorLilaBrilla,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                leftRow(circleCont:
                  Container(
                    height: 60,
                  ),
                ),
                rightRow(circleCont:
                  Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 20.0,
                        height: 20.0,
                        child: Container(
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: kColorLilaBrilla,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                leftRow(circleCont:
                  Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment(1,-0.8),
                      child: SizedBox(
                        width: 20.0,
                        height: 20.0,
                        child: Container(
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: kColorLilaBrilla,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                    rightRow(circleCont:
                      Container(
                        height: 60,
                        child: Align(
                          alignment: Alignment(-0.2, 1),
                          child: SizedBox(
                            width: 20.0,
                            height: 20.0,
                            child: Container(
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: kColorLilaBrilla,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Stack(
                            overflow: Overflow.visible,
                            alignment: Alignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(15),
                                width: 140.0,
                                height: 140.0,
                                margin: EdgeInsets.only(bottom: 5.0),
                                decoration: BoxDecoration(
                                  color: kColorMoradoGris,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Positioned(
                                bottom: -95,
                                child: Container(
                                  padding: EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 5),
                                  width: 320,
                                  height: 140,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Ordena de mayor a menor importancia cada una de las propiedades que componen tu persona",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "PERSONAL FIT",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kColorMoradotOpaco,
                                          fontSize: 35,
                                        ),
                                      ),
                                    ],
                                  ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                    )
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  child: Image.asset('assets/images/player.png'),
                                  width: 140.0,
                                  height: 140.0,
                                  margin: EdgeInsets.only(bottom: 5.0),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                child: Container(
                                  width: 1,
                                  height: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
            )
          ),
        ]
        ),
      ),
    );
  }
}
