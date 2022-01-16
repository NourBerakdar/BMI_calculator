import 'package:flutter/material.dart';
import '../constant.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap,required this.buttonTiltle});
  final VoidCallback onTap;
  final String  buttonTiltle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTiltle,
            style: kLargeButtonTextStyle,
            //textAlign: TextAlign.center,
          ),
        ),
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 20),
        color: kbuttonTopColour,
        width: double.infinity,
        height: kcontainerHigh,
      ),
    );
  }
}
