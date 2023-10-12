// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';



class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String text = '0';
  double numOne = 0;
  double numTwo = 0;
  String op = '';
  double result = 0;

  void calculation(String btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      op = '';
    } else if (btnText == '+/-') {
        numOne = double.parse(text) * -1;
        text = numOne.toString();

    } else if (btnText == '%') {
      numOne = double.parse(text) / 100;
      text = numOne.toString();
    } else if (btnText == '.') {
      if (!text.contains('.')) {
        text += '.';
      }
    } else if (btnText == '=') {
      if (op.isNotEmpty && text.isNotEmpty) {
        numTwo = double.parse(text);
        if (op == '+') {
          numOne += numTwo;
        } else if (op == '-') {
          numOne -= numTwo;
        } else if (op == 'x') {
          numOne *= numTwo;
        } else if (op == '/') {
          numOne /= numTwo;
        }
        text = numOne.toString();
        op = '';
      }
    } else if (btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/') {
      if (text != '0') {
        if (numOne != 0 && op.isNotEmpty && text.isNotEmpty) {
          numTwo = double.parse(text);
          if (op == '+') {
            numOne += numTwo;
          } else if (op == '-') {
            numOne -= numTwo;
          } else if (op == 'x') {
            numOne *= numTwo;
          } else if (op == '/') {
            numOne /= numTwo;
          }
        } else {
          numOne = double.parse(text);
        }
        text = '';
        op = btnText;
      }
    } else {
      if (text == '0') {
        text = btnText;
      } else {
        text += btnText;
      }
    }

    setState(() {
      text = text;
    });
  }



  Widget buildButton(String buttonText, Color buttonColor, Color textColor) {
    return ElevatedButton(
      onPressed: () {
        calculation(buttonText);
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: buttonColor,
        padding: const EdgeInsets.all(30.0),
      ),
      child: Text(
        buttonText,
        style: TextStyle(color: textColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Flutter Calculator',
          style: TextStyle(fontSize: 25.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      text,
                      style: const TextStyle(fontSize: 60, color: Colors.white),

                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton('AC', Colors.grey, Colors.black),
                  buildButton('+/-', Colors.grey, Colors.black),
                  buildButton('%', Colors.grey, Colors.black),
                  buildButton('/', Colors.amber, Colors.white),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton('7', Colors.grey, Colors.white),
                  buildButton('8', Colors.grey, Colors.white),
                  buildButton('9', Colors.grey, Colors.white),
                  buildButton('x', Colors.amber, Colors.white),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton('4', Colors.grey, Colors.white),
                  buildButton('5', Colors.grey, Colors.white),
                  buildButton('6', Colors.grey, Colors.white),
                  buildButton('-', Colors.amber, Colors.white),
                 ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton('1', Colors.grey, Colors.white),
                  buildButton('2', Colors.grey, Colors.white),
                  buildButton('3', Colors.grey, Colors.white),
                  buildButton('+', Colors.amber, Colors.white),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                    calculation('0');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: Colors.grey,
                      padding: const EdgeInsets.fromLTRB(20, 15, 120, 15),
                    ),
                    child: const Text(
                      '0',
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                  ),
                  buildButton('.', Colors.grey, Colors.white),
                  buildButton('=', Colors.amber, Colors.white),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
