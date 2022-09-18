import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
          elevation: 10,
        ),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        sliderTheme: SliderThemeData(
          thumbShape: RoundSliderThumbShape(
            enabledThumbRadius: 15.0,
          ),
          trackHeight: 1,
          trackShape: RoundedRectSliderTrackShape(),
        ),
      ),
      home: InputPage(),
    );
  }
}
