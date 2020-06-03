import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xlo_get/controllers/login_widgets_controller.dart';
import 'package:xlo_get/screens/login/widgets/facebook_button.dart';
import 'package:xlo_get/xxx_temp/stopped_at.dart';

class LoginScreen extends StatelessWidget {
  final LoginWidgetsController _loginWidgetsController =
      LoginWidgetsController();

  // titulo dos campos de entrada de texto
  Text myInputFieldTitle(title) => Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey[800],
          fontWeight: FontWeight.w700,
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Entrar'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FacebookButton(_loginWidgetsController),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 11),
                child: Text(
                  'Acessar com E-mail:',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey[900]),
                ),
              ),
              myInputFieldTitle('E-mail'),
              Obx(
                () => TextField(
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      errorText: _loginWidgetsController.emailErrorText.value,
                    ),
                    onChanged: _loginWidgetsController.changeEmail,
                    enabled: _loginWidgetsController.enableLoginWidgets.value),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3, bottom: 4, top: 26),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: myInputFieldTitle('Senha'),
                    ),
                    Obx(
                      () => FlatButton(
                        onPressed: () {
                          if (_loginWidgetsController.enableLoginWidgets.value)
                            StoppedAt().notImplementedMsg();
                        },
                        child: Text(
                          'Esqueceu sua senha?',
                          style: TextStyle(
                            color:
                                _loginWidgetsController.enableLoginWidgets.value
                                    ? Colors.blue
                                    : Colors.grey[400],
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Obx(
                () => TextField(
                  obscureText: true,
                  autocorrect: false,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    errorText: _loginWidgetsController.passwordErrorText.value,
                  ),
                  onChanged: _loginWidgetsController.changePassword,
                  enabled: _loginWidgetsController.enableLoginWidgets.value,

                  // enabled: () {},
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 24),
                height: 50,
                child: Obx(
                  () => RaisedButton(
                    color: Colors.pink,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    disabledColor: Colors.pink.withAlpha(150),
                    onPressed:
                        _loginWidgetsController.isLoginButtonEnabled.value
                            ? () {
                                _loginWidgetsController
                                    .setStatusTryingLoginWithEmail();

                                /*Aviso do ponto em que parou - remover*/
                                StoppedAt().notImplementedMsg();
                              }
                            : null,
                    child: _loginWidgetsController.tryingLoginWithEmail.value
                        ? CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : Text(
                            'Entrar',
                            style: TextStyle(
                              color: _loginWidgetsController
                                      .enableLoginWidgets.value
                                  ? Colors.white
                                  : Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
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
                    const Text(
                      'Não possui uma conta? ',
                      style: TextStyle(fontSize: 16),
                    ),
                    Obx(() => GestureDetector(
                          onTap: () {
                            if (_loginWidgetsController
                                .enableLoginWidgets.value) {
                              StoppedAt().notImplementedMsg();
                            }
                          },
                          child: Text(
                            'Cadastre-se',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: _loginWidgetsController
                                      .enableLoginWidgets.value
                                  ? Colors.blue
                                  : Colors.grey[400],
                              fontSize: 16,
                            ),
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
