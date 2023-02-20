import "package:flutter/material.dart";

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'roundiconbutton.dart';
import 'calculator_brain.dart';
//import 'results_page.dart';

enum Gender { male, female }

enum Options { plus, minus }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = kInActiveCardColour;
  Color femaleCardColour = kInActiveCardColour;

  late Gender selectedGender = Gender.female;
  int height = 180;
  int weight = 80;
  int age = 18;

  // void updateColour(Gender selectedGender) {
  // if (selectedGender == Gender.male) {
  //   if (maleCardColour == inActiveCardColour) {
  //     maleCardColour = activeCardColour;
  //     femaleCardColour = inActiveCardColour;
  //   } else {
  //     maleCardColour = inActiveCardColour;
  //   }
  // }
  // if (selectedGender == Gender.female) {
  //   if (femaleCardColour == inActiveCardColour) {
  //     femaleCardColour = activeCardColour;
  //     maleCardColour = inActiveCardColour;
  //   } else {
  //     femaleCardColour = inActiveCardColour;
  //   }
  // }

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kActiveCardColour
                          : kInActiveCardColour,
                      cardChild: IconContent(
                        label: "MALE",
                        iconElement: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kActiveCardColour
                          : kInActiveCardColour,
                      cardChild: IconContent(
                        label: "FEMALE",
                        iconElement: FontAwesomeIcons.venus,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "${height}",
                          style: kNumberTextStyle,
                        ),
                        Text(
                          "cm",
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xffeb1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 15),
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0xffeb1555),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        inactiveColor: Color(0xff8d8e98),
                        onChanged: (double newValue) {
                          print(newValue);
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: kLabelTextStyle,
                          ),
                          Text(weight.toString(), style: kNumberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                Options: Options.minus,
                                calculate: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  Options: Options.plus,
                                  calculate: () {
                                    setState(() {
                                      weight++;
                                    });
                                  }),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: kLabelTextStyle,
                          ),
                          Text(age.toString(), style: kNumberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                Options: Options.minus,
                                calculate: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  Options: Options.plus,
                                  calculate: () {
                                    setState(() {
                                      age++;
                                    });

                                    print("This is awesome");
                                  }),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
                buttonTitle: "CALCULATE",
                onTap: () {
                  CalculatorBrain(height: height, weight: weight);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultsPage(
                                bmiResult: CalculatorBrain(height: height, weight: weight).calculateBMI(),
                                interpretation:
                                    CalculatorBrain(weight: weight, height: height).getInterpretation(),
                                resultText: CalculatorBrain(height: height, weight: weight).getResult(),
                              )));
                })
          ],
        ));
  }
}
