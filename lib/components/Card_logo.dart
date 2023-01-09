import 'package:flutter/material.dart';
import '../constants.dart';

class CardLogo extends StatelessWidget {
  CardLogo({required this.gender, this.genderIcon});
  final String gender;
  final IconData? genderIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: kContentStyle,
        )
      ],
    );
  }
}
