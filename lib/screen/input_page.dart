import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/IconContent.dart';
import '../components/reusableCard.dart';
import '../constant.dart';
import 'resultePage.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_calc/calculater_brain.dart';
enum Gender { female, male }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? genderSelected;
  int hight = 180;
  int wight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          genderSelected = Gender.male;
                        },
                      );
                    },
                    child: ReusableCard(
                      coluor: genderSelected == Gender.male
                          ? kactiveCardColour
                          : kinactiveCardColour,
                      childCard: IconContent(
                          label: 'MALE', iconData: FontAwesomeIcons.mars),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        genderSelected = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      coluor: genderSelected == Gender.female
                          ? kactiveCardColour
                          : kinactiveCardColour,
                      childCard: IconContent(
                        label: 'FEMALE',
                        iconData: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              coluor: kactiveCardColour,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: klabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        hight.toString(),
                        style: knumberText,
                      ),
                      Text(
                        'cm',
                        style: klabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTickMarkColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 20.0),
                    ),
                    child: Slider(
                      value: hight.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          hight = newValue.round();
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
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                    coluor: kactiveCardColour,
                    childCard: Column(
                      children: <Widget>[
                        Text(
                          'WIGHT',
                          style: klabelTextStyle,
                        ),
                        Text(
                          wight.toString(),
                          style: knumberText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              iconData: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  wight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              iconData: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  wight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    )),
              ),
              Expanded(
                child: ReusableCard(
                    coluor: kactiveCardColour,
                    childCard: Column(
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: klabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: knumberText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              iconData: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              iconData: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    )),
              ),
            ],
          )),
          BottomButton(
            buttonTiltle: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc=new CalculatorBrain(height: hight,weight: wight);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultePage(bmiResult:calc.calculateBMI() ,resultText:calc.getResult() ,interpretation:calc.getInterpretation() ,)));
            },
          ),
        ],
      ),
    );
  }
}
