import 'package:flutter/material.dart';

// text in web link format with onTap
Widget linkText(String title, double fontSize, Color color, Function onTap) =>
    GestureDetector(
      child: Text(
        title,
        style: TextStyle(
            decoration: TextDecoration.underline,
            color: color,
            fontSize: fontSize),
      ),
      onTap: onTap,
    );
