import 'constants.dart';
import 'package:flutter/material.dart';



class BottomButton extends StatelessWidget {
  late final VoidCallback onTap;
  late final String buttonTitle;

  BottomButton({required this.buttonTitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
            child: Text(
          "CALCULATE YOUR BMI",
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
