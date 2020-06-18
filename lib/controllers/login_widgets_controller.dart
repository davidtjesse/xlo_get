import 'package:get/get.dart';
import 'package:xlo_get/controllers/common_control_functions.dart';

//enum LoginState { IDLE, LOADING, LOADIN_FACE, ERROR, DONE }

class LoginWidgetsController {
  StringX emailErrorText = 'Email é obrigatório'.obs;
  StringX passwordErrorText = 'Digite a senha'.obs;

  BoolX isLoginButtonEnabled = false.obs;
  BoolX enableLoginWidgets = true.obs;
  BoolX tryingLoginWithEmail = false.obs;
  BoolX tryingLoginWithFacebook = false.obs;

  bool isValidEmail = false;
  bool isValidPassword = false;

  /* when the text in field of email is changed */
  onChangeEmail(String t) {
    String result;

    Map emailCheckResult = CommonControlFunctions().checkEmailFormat(t);

    result = emailCheckResult['resultMsg'];
    isValidEmail = emailCheckResult['isValid'];

    if (emailErrorText.value != result) {
      emailErrorText.value = result;
      _manageEmailButtonEnable();
    }
  }


/* when the password field is changed */
  onChangePassword(String t) {
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

  setStatusLoginError() {
    enableLoginWidgets.value = true;
    isLoginButtonEnabled.value = false;
    tryingLoginWithEmail.value = false;
    tryingLoginWithFacebook.value = false;
    _manageEmailButtonEnable();
  }

  /*Check if the email and password is valid */
  _manageEmailButtonEnable() {
    if ((isValidEmail && isValidPassword) != isLoginButtonEnabled.value)
      isLoginButtonEnabled.value = isValidEmail && isValidPassword;
  }
}
