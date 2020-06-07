import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:xlo_get/common/link_text/link_text.dart';
import 'package:xlo_get/controllers/sign_up_widgets_controller.dart';
import 'package:xlo_get/screens/signup/widgets/field_title.dart';
import 'package:xlo_get/screens/signup/widgets/password_field.dart';
import 'package:xlo_get/xxx_temp/stopped_at.dart';

class SignUpScreen extends StatelessWidget {
  final SignUpWidgetsController _widgetsCtrl = SignUpWidgetsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          FieldTitle('Apelido', 'Como aparecerá em seus anúncios.'),
          Obx(
            () => TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Exemplo: João S.',
                errorText: _widgetsCtrl.nickErrorText.value,
              ),
              onChanged: _widgetsCtrl.onChangeNick,
              enabled: _widgetsCtrl.enableFormWidgets.value,
            ),
          ),
          SizedBox(height: 26),
          FieldTitle('E-mail', 'Será enviado um e-mail de confirmação.'),
          Obx(
            () => TextField(
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                errorText: _widgetsCtrl.emailErrorText.value,
              ),
              onChanged: _widgetsCtrl.onChangeEmail,
              enabled: _widgetsCtrl.enableFormWidgets.value,
            ),
          ),
          SizedBox(height: 26),
          FieldTitle('Senha', 'Use letras, números e caracteres especiais.'),
          PasswordField(_widgetsCtrl),
          Obx(
            () => Container(
              margin: EdgeInsets.symmetric(vertical: 24),
              height: 50,
              child: RaisedButton(
                color: Colors.pink,
                disabledColor: Colors.pink.withAlpha(150),
                child: _widgetsCtrl.enableFormWidgets.value
                    ? Text(
                        'Cadastrar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    : CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                onPressed: _widgetsCtrl.enableSignUpButton.value
                    ? () {
                        StoppedAt().notImplementedMsg();
                        _widgetsCtrl.enableFormWidgets.value = false;
                      }
                    : null,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          Divider(color: Colors.grey),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Já possui uma conta? '),
                LinkText('Entrar', 16, Colors.blue, () => Get.back())
              ],
            ),
          )
        ],
      ),
    );
  }
}
