import 'constants.dart';
import 'package:flutter/material.dart';



class RoundIconButton extends StatelessWidget {
  const RoundIconButton(
      {required this.icon, required this.Options, required this.calculate});
  final IconData icon;
  final Options;
  final void Function() calculate;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      onPressed: calculate,
      child: Icon(icon),
      elevation: 6,
      constraints: const BoxConstraints.tightFor(width: 56, height: 56),
      fillColor: kFloatingActionColour,
    );
  }
}