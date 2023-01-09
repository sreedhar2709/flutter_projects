import 'package:bmi_calculator/components/BottomButton.dart';
import 'package:bmi_calculator/components/Reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.result, required this.bmi, required this.observation});

  final String? result;
  final String? bmi;
  final String? observation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    result.toString(),
                    style: kResultStyle,
                  ),
                  Text(
                    bmi.toString(),
                    style: kBMITextStyle,
                  ),
                  Text(
                    observation.toString(),
                    textAlign: TextAlign.center,
                    style: kContentStyle,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
              buttonTitle: 'RE-CALCULATE',
              onClick: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
