import 'dart:html';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData.dark(),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String displayValue = '0';
  String operand = '';
  double firstOperand = 0;
  bool shouldClearDisplay = false;

  void onDigitPressed(String digit) {
    if (shouldClearDisplay) {
      setState(() {
        displayValue = digit;

        shouldClearDisplay = false;
      });
    } else {
      setState(() {
        displayValue = (displayValue == '0') ? digit : displayValue + digit;
      });
    }
  }

  void onOperatorPressed(String newOperand) {
    if (operand.isNotEmpty) {
      calculateResult();
    } else {
      setState(() {
        firstOperand = double.parse(displayValue);
        operand = newOperand;
        shouldClearDisplay = true;
      });
    }
  }

  void onEqualsPressed() {
    if (operand.isNotEmpty) {
      calculateResult();
    }
  }

  void calculateResult() {
    double secondOperand = double.parse(displayValue);
    double result = 0;

    switch (operand) {
      case '+':
        result = firstOperand + secondOperand;
        break;
      case '-':
        result = firstOperand - secondOperand;
        break;
      case '×':
        result = firstOperand * secondOperand;
        break;
      case '÷':
        result = firstOperand / secondOperand;
        break;
      case '%':
        result = firstOperand % secondOperand;
        break;
      case '√':
        result = sqrt(firstOperand);
        break;
    }

    setState(() {
      displayValue = result.toString();
      operand = '';
      shouldClearDisplay = true;
    });
  }

  void onClearPressed() {
    setState(() {
      displayValue = '0';
      operand = '';
      firstOperand = 0;
      shouldClearDisplay = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      )),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(0.0),
              color: Color.fromARGB(0, 127, 218, 245),
              alignment: Alignment.bottomRight,
              child: Text(
                displayValue,
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),,
            ),,
          )])}