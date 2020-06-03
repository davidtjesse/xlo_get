import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xlo_get/controllers/login_widgets_controller.dart';
import 'package:xlo_get/xxx_temp/simulations.dart';

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
          color: Color.fromRGBO(58, 89, 152, 1),
          disabledColor: Color.fromRGBO(58, 89, 152, 0.7),
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          onPressed: _loginWidgetsController.enableLoginWidgets.value
              ? () async {
                  _loginWidgetsController.setStatusTryingLoginWithFacebook();

                  bool success =
                      await Simulations().simulateConnectionDelay(false);
                  if (success) {
                    print('Logado com Sucesso pelo Facebook');

                    Get.back();
                  } else {
                    _loginWidgetsController.setStatusLoginError();

                    Get.defaultDialog(
                        title: 'SIMULATING A ERROR: Não foi possível login com Facebook',
                        middleText:
                            'Verifique a conexão com a internet, e/ou sua situação com o Facebook',
                        confirmTextColor: Colors.white,
                        onConfirm: () {
                          Get.back();
                        });
                  }
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
