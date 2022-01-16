import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
class IconContent extends StatelessWidget {
  IconContent({required this.label, required this.iconData});

  final String label;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(height: 15.0),
        Text(label, style:klabelTextStyle,
        )
      ],
    );
  }
}
