import 'package:flutter/material.dart';

class LinkText extends StatelessWidget {
  LinkText(this.title, this.fontSize, this.color, this.onTap);
  final String title;
  final double fontSize;
  final Color color;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        title,
        style: TextStyle(
            decoration: TextDecoration.underline,
            color: color,
            fontSize: fontSize),
      ),
      onTap: onTap,
    );
  }
}
