import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/Card_logo.dart';
import '../components/Reusable_card.dart';
import '../constants.dart';
import '../pages/results_page.dart';
import 'package:bmi_calculator/components/calculator.dart';
import 'package:bmi_calculator/components/BottomButton.dart';
import 'package:bmi_calculator/components/RoundButton.dart';

enum GenderType {
  male,
  female,
}

Color maleCardColour = kCardColor;
Color femaleCardColour = kCardColor;
GenderType? Gender;
int height = 120;
int weight = 60;
int age = 25;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    press: () {
                      setState(() {
                        Gender = GenderType.male;
                      });
                    },
                    colour: Gender == GenderType.male
                        ? Color(0xFF303F9F)
                        : kCardColor,
                    cardChild: CardLogo(
                      gender: 'MALE',
                      genderIcon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    press: () {
                      setState(() {
                        setState(() {
                          Gender = GenderType.female;
                        });
                      });
                    },
                    colour: Gender == GenderType.female
                        ? kBottomContainerColor
                        : kCardColor,
                    cardChild: CardLogo(
                      gender: 'FEMALE',
                      genderIcon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kContentStyle,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      Text(
                        'cm',
                        style: kContentStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                        activeTrackColor: Color(0xFFEB1555),
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: Colors.white,
                        overlayColor: Color(0x80EB1555),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30.0,
                        )),
                    child: Slider(
                      value: height.toDouble(),
                      min: 0.0,
                      max: 300.0,
                      onChanged: (double newVal) {
                        setState(() {
                          height = newVal.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: kContentStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              iconData: FontAwesomeIcons.minus,
                              clickData: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              iconData: FontAwesomeIcons.plus,
                              clickData: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: kContentStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              iconData: FontAwesomeIcons.minus,
                              clickData: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              iconData: FontAwesomeIcons.plus,
                              clickData: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onClick: () {
              Calculator calc = Calculator(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmi: calc.calculateBMI(),
                    observation: calc.getAdvice(),
                    result: calc.getResult(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
