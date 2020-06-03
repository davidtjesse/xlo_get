// remove os pontos da formatação brasil para milhares para evitar problemas
// de parse para inteiros

/* remove qualquer caracter que não seja número */
String getSanitizedText(String text) {
  return text.replaceAll(RegExp(r'[^\d]'), '');
}
