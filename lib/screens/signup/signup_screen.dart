import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xlo_get/controllers/sign_up_widgets_controller.dart';
import 'package:xlo_get/screens/signup/widgets/field_title.dart';
import 'package:xlo_get/screens/signup/widgets/password_field.dart';

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
              enabled: _widgetsCtrl.enableSignUpWidgets.value,
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
              enabled: _widgetsCtrl.enableSignUpWidgets.value,
            ),
          ),
          SizedBox(height: 26),
          FieldTitle('Senha', 'Use letras, números e caracteres especiais.'),
          PasswordField(),
        ],
      ),
    );
  }
}
