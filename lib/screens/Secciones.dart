import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pathapp/utilities/components/RoundedButton.dart';
import 'package:pathapp/utilities/components/ReusableCard.dart';
import 'package:pathapp/utilities/components/CardIcon.dart';
import 'package:pathapp/utilities/constants.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SeccionesScreen extends StatefulWidget {
  @override
  _SeccionesScreenState createState() => _SeccionesScreenState();
}

class _SeccionesScreenState extends State<SeccionesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.menu,
          color: kColorMorado,
        )
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 60.0, bottom: 30.0, right: 25.0, left: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Continúa tu aventura...',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        LinearPercentIndicator(
                          alignment: MainAxisAlignment.end,
                          width: MediaQuery.of(context).size.width - 200,
                          animation: true,
                          lineHeight: 20.0,
                          animationDuration: 1000,
                          percent: 0.8,
                          center: Text("80.0%"),
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          progressColor: Colors.white,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        RoundedButton(
                          titleText: 'CONTINUAR',
                          colorProperty: Colors.white,
                          onPressedFunction: (){},
                        ),
                      ],
                    ),
                  ),
                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      color: kColorMorado,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(4, 8),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colore: kColorAzul,
                      tapFunction: (){},
                      cardChild: CardIcon(
                        nameImage: 'assets/images/light-bulb.png',
                        iconTitle: 'Ramas del conocimiento',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colore: kColorAmarillo,
                      tapFunction: (){},
                      cardChild: CardIcon(
                        nameImage: 'assets/images/world-map.png',
                        iconTitle: 'Problemas del mundo',
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colore: kColorNaranja,
                      tapFunction: (){},
                      cardChild: CardIcon(
                        nameImage: 'assets/images/treasure.png',
                        iconTitle: 'Capital de carrera',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colore: kColorCafe,
                      tapFunction: (){},
                      cardChild: CardIcon(
                        nameImage: 'assets/images/paper-plane.png',
                        iconTitle: 'Personal fit',
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
