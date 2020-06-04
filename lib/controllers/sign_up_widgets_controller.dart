import 'package:get/get.dart';
import 'package:xlo_get/controllers/common_control_funcions.dart';

class SignUpWidgetsController {

  StringX nickErrorText = 'O apelido é obrigatório'.obs;
  StringX emailErrorText = 'Email é obrigatório'.obs;

  BoolX enableSignUpWidgets = true.obs;

  bool isValidNick = false;
  bool isValidEmail = false;

  onChangeNick(String t) {
    String result;
    if (t.isEmpty) {
      result = "O apelido é obrigatório";
      isValidNick = false;
    } else if (t.length < 6) {
      result = 'O aplelido precisa ter mais de 5 caracteres';
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
}
