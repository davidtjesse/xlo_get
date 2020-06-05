import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xlo_get/controllers/common_control_funcions.dart';

class SignUpWidgetsController {
  StringX nickErrorText = 'O apelido é obrigatório'.obs;
  StringX emailErrorText = 'Email é obrigatório'.obs;

  StringX passwordStrengthInfo = "A senha é obrigatória!".obs;
  IntX passwordStrength = 0.obs;

  BoolX enableSignUpWidgets = true.obs;

  bool isValidNick = false;
  bool isValidEmail = false;

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
      // _manageEmailButtonEnable();
    }
  }

  onChangeEmail(String t) {
    String result;

    Map emailCheckResult = CommonControlFunctions().checkEmailFormat(t);

    result = emailCheckResult['resultMsg'];
    isValidEmail = emailCheckResult['isValid'];

    if (emailErrorText.value != result) {
      emailErrorText.value = result;
      //     _manageEmailButtonEnable();
    }
  }

  onChangePassword(String text) {
    int score = 0;

    if (text.length > 5) {
      score += 1;
      if (text.length > 8) score += 1;
      if (text.contains(RegExp(r'[0-9]'))) score += 1;
      if (text.contains(RegExp(r'[A-Z]'))) score += 1;
    }

    if (passwordStrength.value != score) {
      passwordStrength.value = score;

      if (score == 0)
        passwordStrengthInfo.value =
            'A senha precisa ter mais de 5 caracteres!';
      else
        passwordStrengthInfo.value = _getText(score);
    }

    //     _manageEmailButtonEnable();
  }

  String _getText(int level) {
    List<String> strength = [
      'insuficiente',
      'muito fraca',
      'razoavelmente fraca',
      'razoavelmente forte',
      'forte'
    ];

    return 'Força da senha: ${strength[level]}';
  }

  Color getBarColor(int n) {
    List<Color> colors = [
      Colors.red,
      Colors.orange,
      Colors.greenAccent,
      Colors.green,
      Colors.blue
    ];
    return colors[n];
  }
}
