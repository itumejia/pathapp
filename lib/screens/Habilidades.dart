import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pathapp/utilities/constants.dart';
import 'package:pathapp/utilities/components/fieldList.dart';
import 'package:provider/provider.dart';
import 'package:pathapp/utilities/models/field_data.dart';

class HabilidadesScreen extends StatefulWidget {
  static String id='personal_rating_screen';
  @override
  _HabilidadesScreenState createState() => _HabilidadesScreenState();
}

class _HabilidadesScreenState extends State<HabilidadesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: kColorMorado,
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 30.0, bottom: 30.0, right: 20.0, left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Image.asset('assets/images/player.png'),
                    width: 140.0,
                    height: 140.0,
                    margin: EdgeInsets.only(bottom: 5.0),
                    decoration: BoxDecoration(
                      color: kColorMoradoGris,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
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
                            create: (context) => FieldData(),
                            child: FieldList()
                        ),
                    ),
                    Positioned(
                      bottom: -40,
                      child: Container(
                        child: Text(
                          'LCPF',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        margin: EdgeInsets.all(10),
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
                    )
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Enlista 5 de tus mejores habilidades. Y puntua del 1 al 5 qué tanto se relacionan con la carrera en cuestión",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  )
                ),
              )
            ],
        ),
      ),
    )
    );
  }
}


