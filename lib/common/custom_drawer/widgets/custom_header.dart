import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:xlo_get/screens/login/login_screen.dart';

class CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Text myText(String text, double fontSize) => Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
          ),
          overflow: TextOverflow.clip,
        );

    return GestureDetector(
      onTap: () {
        Get.to(LoginScreen());
      },
      child: Container(
        height: 115,
        padding: const EdgeInsets.only(left: 40),
        color: Colors.blue,
        child: Row(
          children: <Widget>[
            Icon(
              Icons.person,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  myText('Acesse sua conta agora!', 16),
                  myText('Clique aqui', 14),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
