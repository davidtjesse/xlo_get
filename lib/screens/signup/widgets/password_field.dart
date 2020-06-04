import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildBar(int n, String pass) {
      final int level = _calcScore(pass);
      return Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: n <= level ? _getColor(level) : Colors.transparent,
            border: n > level ? Border.all(color: Colors.grey) : null,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextField(
          decoration: const InputDecoration(border: OutlineInputBorder()),
          obscureText: true,
          // onchanged
        ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          height: 8,
          child: Row(
            children: <Widget>[
              _buildBar(0, 'anS'),
              _buildBar(1, 'anS'),
              _buildBar(2, 'anS1'),
              _buildBar(3, 'anS'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6, left: 10),
          child: Text(
            _getText(
              _calcScore('sn9'),
            ),
            style: TextStyle(
              color: _getColor(_calcScore('sn9')),
              fontSize: 14,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }

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
}
