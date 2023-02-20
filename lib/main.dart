import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        sliderTheme: SliderTheme.of(context).copyWith(
          thumbColor: Color(0xffeb1555),
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 15),
          overlayColor: Color(0xffeb1555),
        ),
        appBarTheme: AppBarTheme(
          color: Color(0xFF0a0e22), //<-- SEE HERE
        ),
        scaffoldBackgroundColor: const Color(0xFF0a0e22),
        primaryColor: Color(0xFF0a0e22),
      ),
      home: InputPage(),
    );
  }
}
