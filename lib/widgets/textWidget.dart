
import 'package:flutter/material.dart';

Widget textWidget({required String text,double fontSize =14,
fontWeight,color,}){
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}