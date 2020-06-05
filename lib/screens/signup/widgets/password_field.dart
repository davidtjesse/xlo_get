import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xlo_get/controllers/sign_up_widgets_controller.dart';

class PasswordField extends StatelessWidget {
  PasswordField(this._widgetsCtrl);

  final SignUpWidgetsController _widgetsCtrl;

  @override
  Widget build(BuildContext context) {
    Widget _buildBar(int n) {
      //final int level = _calcScore(pass);
      return Obx(
        () => Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              // color: _widgetsCtrl.getBarColor(n)

              color: n < _widgetsCtrl.passwordStrength.value
                  ? _widgetsCtrl.getBarColor(n)
                  : Colors.transparent,
              border: n > _widgetsCtrl.passwordStrength.value - 1
                  ? Border.all(color: Colors.grey)
                  : null,

              //color: n <= level ? _getColor(level) : Colors.transparent,
              // border: n > level ? Border.all(color: Colors.grey) : null,
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Obx(
          () => TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
          //    errorText: _widgetsCtrl.passwordErrorText.value,
            ),
            onChanged: _widgetsCtrl.onChangePassword,
            enabled: _widgetsCtrl.enableSignUpWidgets.value,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          height: 8,
          child: Row(
            children: <Widget>[
              _buildBar(0),
              _buildBar(1),
              _buildBar(2),
              _buildBar(3),
              _buildBar(4),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6, left: 10),
          child: Obx(
            () => Text(
              _widgetsCtrl.passwordStrengthInfo.value,
              style: TextStyle(
                //  color: _getColor(_calcScore('sn9')),
                fontSize: 14,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }

  /*
  int _calcScore(String text) {
    int score = 0;
    if (text.length > 8) score += 1;
    if (text.contains(RegExp(r'[0-9]'))) score += 1;
    if (text.contains(RegExp(r'[A-Z]'))) score += 1;
    return score;
  }

  Color _getColor(int level) {
    List<Color> colors = [
      Colors.red,
      Colors.orange,
      Colors.greenAccent,
      Colors.green
    ];
    return colors[level];
  }

  String _getText(int level) {
    List<String> strength = [
      'muito fraca',
      'razoavelmente fraca',
      'razoavelmente forte',
      'forte'
    ];
    return 'Força da senha: ${strength[level]}';
  }



   */
}
