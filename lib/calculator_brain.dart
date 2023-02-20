import 'dart:math';

import 'package:flutter/material.dart';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});
  late final int height;
  late final int weight;
  double _bmi = 12;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

 

  String getResult() {
    if (_bmi >= 25) {
      return "Overwight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }


  String getInterpretation(){
    if (_bmi >= 25) {
      return "You have a higher than normal body wight. Try to exercise more";
    } else if (_bmi > 18.5) {
      return "You have a normal body weight. Great job!";
    } else {
      return "You have a lower than normal body wight. You can eat a bit more";;
    }
  }
}
