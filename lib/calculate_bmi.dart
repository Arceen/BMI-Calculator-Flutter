import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/carded_containers.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class CalculateBMI extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  CalculateBMI(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: CardedContainers(
                passedOnTap: () {},
                cardColor: kActiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(resultText,
                        style: resultText == 'Normal'
                            ? kResultTextStyle
                            : resultText == 'Overweight'
                                ? kResultTextStyleOver
                                : kResultTextStyleUnder),
                    Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      style: kBodyTextStyle,
                    ),
                  ],
                ),
              )),
          BottomButton(
              text: 'Re-Calculate',
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
