import 'package:get/get.dart';

enum LoginState { IDLE, LOADING, LOADIN_FACE, ERROR, DONE }

class LoginWidgetsController {
  StringX emailErrorText = 'Email é obrigatório'.obs;
  StringX passwordErrorText = 'Digite a senha'.obs;

  BoolX isLoginButtonEnabled = false.obs;
  BoolX enableLoginWidgets = true.obs;
  BoolX tryingLoginWithEmail = false.obs;
  BoolX tryingLoginWithFacebook = false.obs;

  bool isValidEmail = false;
  bool isValidPassword = false;

  /* Quando há alterações no campo de email */
  changeEmail(String t) {
    String result;

    if (t.isEmpty)
      result = 'Preenchimento obrigatório';
    else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(t)) {
      result = 'Digite um email válido';
      isValidEmail = false;
    } else {
      result = null;
      isValidEmail = true;
    }

    if (emailErrorText.value != result) {
      emailErrorText.value = result;
      _manageEmailButtonEnable();
    }
  }

  changePassword(String t) {
    String result;

    if (t.isEmpty) {
      result = "Digite a senha";
      isValidPassword = false;
    } else if (t.length < 5) {
      result = 'A senha precisa ter mais de 4 caracteres';
      isValidPassword = false;
    } else {
      result = null;
      isValidPassword = true;
    }

    if (passwordErrorText.value != result) {
      passwordErrorText.value = result;
      _manageEmailButtonEnable();
    }
  }

  setStatusTryingLoginWithEmail() {
    enableLoginWidgets.value = false;
    isLoginButtonEnabled.value = false;
    tryingLoginWithEmail.value = true;
    tryingLoginWithFacebook.value = false;
  }

  setStatusTryingLoginWithFacebook() {
    enableLoginWidgets.value = false;
    isLoginButtonEnabled.value = false;
    tryingLoginWithEmail.value = false;
    tryingLoginWithFacebook.value = true;
  }

  _manageEmailButtonEnable() {
    if ((isValidEmail && isValidPassword) != isLoginButtonEnabled.value)
      isLoginButtonEnabled.value = isValidEmail && isValidPassword;
  }
}
