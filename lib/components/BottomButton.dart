import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.buttonTitle, required this.onClick});

  final String buttonTitle;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
          margin: EdgeInsets.only(top: 10.0),
          width: double.infinity,
          color: kBottomContainerColor,
          height: kBottomContainerHeight,
        ),
      ),
    );
  }
}
