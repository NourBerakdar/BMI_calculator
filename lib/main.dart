import 'dart:ui';
import 'screen/input_page.dart';
import 'package:flutter/material.dart';
import 'components/createMaterialColor.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xFF0A0E21)),
        scaffoldBackgroundColor: createMaterialColor(Color(0xFF0A0E21)),
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: InputPage(),
    );
  }
}


