import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmazeflutter/constants/Config.dart';

class CustomText extends StatelessWidget {
  final text;

  CustomText({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        shadows: <Shadow>[
          Shadow(
            offset: Offset(0.0, 0.0),
            blurRadius: 1.0,
            color: Config.COLORPRIMARY,
          ),
        ],
      ),
    );
  }
}
