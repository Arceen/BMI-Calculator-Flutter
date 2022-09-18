import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/calculate_bmi.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/carded_containers.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/icon_card.dart';
import 'package:bmi_calculator/round_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  None,
  Male,
  Female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int currentHeight = kInitHeight;
  int currentWeight = kInitWeight;
  int currentAge = kInitAge;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardedContainers(
                      passedOnTap: () {
                        setState(() {
                          selectedGender = selectedGender == Gender.Male
                              ? Gender.None
                              : Gender.Male;
                        });
                      },
                      cardColor: selectedGender == Gender.Male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      child:
                          IconCard(icon: FontAwesomeIcons.mars, text: "MALE")),
                ),
                Expanded(
                  child: CardedContainers(
                    passedOnTap: () {
                      setState(() {
                        selectedGender = selectedGender == Gender.Female
                            ? Gender.None
                            : Gender.Female;
                      });
                    },
                    cardColor: selectedGender == Gender.Female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child:
                        IconCard(icon: FontAwesomeIcons.venus, text: "FEMALE"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CardedContainers(
              passedOnTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "HEIGHT",
                    style: kTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      SizedBox(width: 25),
                      Text(currentHeight.toString(), style: kNumberStyle),
                      SizedBox(width: 3),
                      Text("cm", style: kTextStyle),
                    ],
                  ),
                  Slider(
                    value: currentHeight.toDouble(),
                    min: kMinHeight.toDouble(),
                    max: kMaxHeight.toDouble(),
                    activeColor: kSliderActiveColor,
                    inactiveColor: kSliderInactiveColor,
                    onChanged: (newValue) {
                      setState(() {
                        currentHeight = newValue.toInt();
                      });
                    },
                    thumbColor: Color(0xFFEB1555),
                  ),
                ],
              ),
              cardColor: kActiveCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardedContainers(
                    passedOnTap: () {},
                    cardColor: kActiveCardColor,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: kTextStyle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(currentWeight.toString(), style: kNumberStyle),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                  icon: Icon(FontAwesomeIcons.minus),
                                  thisOnPress: () {
                                    setState(() {
                                      currentWeight--;
                                    });
                                  }),
                              SizedBox(width: 10),
                              RoundButton(
                                  icon: Icon(FontAwesomeIcons.plus),
                                  thisOnPress: () {
                                    setState(() {
                                      currentWeight++;
                                    });
                                  }),
                            ],
                          )
                        ]),
                  ),
                ),
                Expanded(
                  child: CardedContainers(
                    passedOnTap: () {},
                    cardColor: kActiveCardColor,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: kTextStyle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(currentAge.toString(), style: kNumberStyle),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                  icon: Icon(FontAwesomeIcons.minus),
                                  thisOnPress: () {
                                    setState(() {
                                      currentAge--;
                                    });
                                  }),
                              SizedBox(width: 10),
                              RoundButton(
                                  icon: Icon(FontAwesomeIcons.plus),
                                  thisOnPress: () {
                                    setState(() {
                                      currentAge++;
                                    });
                                  }),
                            ],
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: (() {
              CalculatorBrain calc =
                  CalculatorBrain(height: currentHeight, weight: currentWeight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CalculateBMI(
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          )));
            }),
            text: "Calculate",
          ),
        ],
      ),
    );
  }
}
