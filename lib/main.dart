// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:flutter_application_1/btn.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(
      const MaterialApp(
        home: calcut(),
        debugShowCheckedModeBanner: false,
      ),
    );

class calcut extends StatefulWidget {
  const calcut({Key? key}) : super(key: key);

  @override
  State<calcut> createState() => _calcutState();
}

class _calcutState extends State<calcut> {
  var userQuestion = "";
  var userAnswere = "";

  final myTextstyle = TextStyle(fontSize: 30, color: Colors.deepPurple[900]);

  final List<String> butttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'X',
    '6',
    '5',
    '4',
    '_',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepPurple[100],
        child: Column(
          children: [
            Expanded(
              child: Container(
                //color: Colors.deepPurple[100],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // Important verryyy important
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      // move text left
                      alignment: Alignment.centerLeft,
                      child: Text(
                        userQuestion,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(20),
                        // move text right
                        alignment: Alignment.centerRight,
                        child: Text(
                          userAnswere,
                          style: TextStyle(fontSize: 20),
                        )),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                //color: Colors.deepPurple[100],
                child: GridView.builder(
                  itemCount: butttons.length, // count index
                  // یعنی 4 ستون 4 تایی
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    // Search about it?
                    if (index == 0) {
                      return Mybtn(
                        buttonTap: () {
                          setState(() {
                            userQuestion = '';
                            userAnswere = '';
                          });
                        },
                        textbtn: butttons[index],
                        Color: Colors.green,
                        textcolor: Colors.white,
                      );
                    } else if (index == 1) {
                      return Mybtn(
                        buttonTap: () {
                          // verry important
                          setState(() {
                            userQuestion = userQuestion.substring(
                                0, userQuestion.length - 1);
                          });
                        },
                        textbtn: butttons[index],
                        Color: Colors.red,
                        textcolor: Colors.white,
                      );
                      // equal btn
                    } // equal btn
                    else if (index == butttons.length - 1) {
                      return Mybtn(
                        buttonTap: () {
                          // verry important
                          setState(() {
                            equalPressed();
                          });
                        },
                        textbtn: butttons[index],
                        Color: Colors.deepPurple,
                        textcolor: Colors.white,
                      );
                      // equal btn
                    } else {
                      return Mybtn(
                        buttonTap: () {
                          setState(() {
                            userQuestion += butttons[index];
                          });
                        },
                        textbtn: butttons[index],
                        Color: isOprator(butttons[index])
                            ? Colors.deepPurple
                            : Colors.deepPurple[50],
                        textcolor: isOprator(butttons[index])
                            ? Colors.white
                            : Colors.deepPurple,
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isOprator(String x) {
    if (x == '%' || x == '/' || x == 'X' || x == '_' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('X', '*');
    finalQuestion = finalQuestion.replaceAll('_', '-');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswere = eval.toString();
  }
}
