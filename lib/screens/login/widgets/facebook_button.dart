import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xlo_get/controllers/login_widgets_controller.dart';

class FacebookButton extends StatelessWidget {
  FacebookButton(this._loginWidgetsController);
  final LoginWidgetsController _loginWidgetsController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: EdgeInsets.symmetric(vertical: 16),
        height: 50,
        child: RaisedButton(
          color: Colors.blue,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          onPressed: _loginWidgetsController.enableLoginWidgets.value
              ? () {
                  _loginWidgetsController.setStatusTryingLoginWithFacebook();
                }
              : null,
          child: _loginWidgetsController.tryingLoginWithFacebook.value
              ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : Text(
                  'Login com Facebook',
                  style: TextStyle(
                      color: _loginWidgetsController.enableLoginWidgets.value
                          ? Colors.white
                          : Colors.grey[600],
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
        ),
      ),
    );
  }
}
