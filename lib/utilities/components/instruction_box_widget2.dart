import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class InstructionBoxWidget extends StatelessWidget {
  final String texto;
  final Function toDo;
  InstructionBoxWidget({this.texto,this.toDo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          GestureDetector(
            child: SvgPicture.asset(
              "assets/images/rombo.svg",
              //width: 20,
            ),
            onTap: toDo,
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                  child: Text(
                      texto,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      style: GoogleFonts.amaranth(
                        textStyle: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                  )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.transparent,
                    border: Border.all(color: Colors.white,width: 1)
                  ),
                )
            ),
          ),
        ],
      ),
    );
    }
}
