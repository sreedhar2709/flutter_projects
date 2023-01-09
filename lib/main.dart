import 'package:flutter/material.dart';
import 'pages/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Color(0xFF0E1020),
              secondary: Colors.purple,
            ),
        scaffoldBackgroundColor: Color(0xFF0E1020),
      ),
      home: InputPage(),
    );
  }
}
