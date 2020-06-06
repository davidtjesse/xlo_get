import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xlo_get/controllers/common_control_funcions.dart';

class SignUpWidgetsController {
  StringX nickErrorText = 'O apelido é obrigatório'.obs;
  StringX emailErrorText = 'Email é obrigatório'.obs;

  StringX passwordStrengthInfo = "A senha é obrigatória!".obs;
  IntX passwordStrength = 0.obs;

  BoolX enableFormWidgets = true.obs;
  BoolX enableSignUpButton = false.obs;

  bool isValidNick = false;
  bool isValidEmail = false;
  bool isValidPassword = false;

  onChangeNick(String t) {
    String result;
    if (t.isEmpty) {
      result = "O apelido é obrigatório";
      isValidNick = false;
    } else if (t.length < 6) {
      result = 'O apelido precisa ter mais de 5 caracteres';
      isValidNick = false;
    } else {
      result = null;
      isValidNick = true;
    }

    if (nickErrorText.value != result) {
      nickErrorText.value = result;
      _checkReadyToSignUp();
    }
  }

  onChangeEmail(String t) {
    String result;

    Map emailCheckResult = CommonControlFunctions().checkEmailFormat(t);

    result = emailCheckResult['resultMsg'];
    isValidEmail = emailCheckResult['isValid'];

    if (emailErrorText.value != result) {
      emailErrorText.value = result;
      _checkReadyToSignUp();
    }
  }

  onChangePassword(String text) {
    int score = 0;
    if (text.isEmpty) {
      passwordStrengthInfo.value = 'A senha é obrigatória!';
      isValidPassword = false;
    } else if (text.length > 5) {
      if (text.contains(RegExp(r'[a-z]'))) score++;
      if (text.contains(RegExp(r'[A-Z]'))) score++;
      if (text.contains(RegExp(r'[0-9]'))) score++;

      if (text.length > 8) score++;
      if (text.length > 10) score++;
    }

    if (passwordStrength.value != score) {
      passwordStrength.value = score;

      if (score == 0) {
        passwordStrengthInfo.value =
            'A senha precisa ter mais de 5 caracteres!';
        isValidPassword = false;
        _checkReadyToSignUp();
      } else {
        passwordStrengthInfo.value = _getText(score);
        isValidPassword = true;
        _checkReadyToSignUp();
      }
    }
  }

  String _getText(int level) {
    List<String> strength = [
      'null',
      'muito fraca',
      'razoavelmente fraca',
      'razoável',
      'razoavelmente forte',
      'forte'
    ];

    return 'Força da senha: ${strength[level]}';
  }

  Color getBarColor(int n) {
    List<Color> colors = [
      Colors.red,
      Colors.deepOrangeAccent,
      Colors.orangeAccent,
      Colors.lightGreen,
      Colors.green
    ];
    return colors[n];
  }

  void _checkReadyToSignUp() {
    bool ready;
    ready = isValidNick && isValidEmail && isValidPassword;

    if (ready != enableSignUpButton.value) {
      enableSignUpButton.value = ready;
    }
  }
}
