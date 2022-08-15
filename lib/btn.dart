import 'package:flutter/material.dart';

class Mybtn extends StatelessWidget {
  final Color;
  final textcolor;
  final String textbtn;
  final buttonTap;

  Mybtn({this.Color, this.textcolor, required this.textbtn, this.buttonTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            //width: 50,
            //height: 50,
            color: Color,
            child: Center(
              child: Text(
                textbtn,
                style: TextStyle(color: textcolor, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
