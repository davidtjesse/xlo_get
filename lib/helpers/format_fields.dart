// remove os pontos da formatação brasil para milhares para evitar problemas
// de parse para inteiros

/* remove qualquer caracter que não seja número */
import 'package:intl/intl.dart';

String getSanitizedText(String text) {
  return text.replaceAll(RegExp(r'[^\d]'), '');
}

String numToString(num number) {
  return NumberFormat('###,##0.00', 'pt-br')
      .format(double.parse(number.toStringAsFixed(2)));
}

String dateToString(DateTime dateTime){
  return DateFormat('dd/MM HH:mm', 'pt-br').format(dateTime);
}