class CommonControlFunctions {
  Map<String, dynamic> checkEmailFormat(String email) {
    String resultMsg;
    bool isValid;

    if (email.isEmpty) {
      resultMsg = 'O e-mail é obrigatório';
      isValid = false;
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      resultMsg = 'Digite um email válido';
      isValid = false;
    } else {
      resultMsg = null;
      isValid = true;
    }

    return {'resultMsg': resultMsg, 'isValid': isValid};
  }
}
