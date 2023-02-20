import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  final IconData iconElement;
  final String label;

  IconContent({required this.iconElement, required this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconElement,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text("${this.label}", style: kLabelTextStyle)
      ],
    );
  }
}
