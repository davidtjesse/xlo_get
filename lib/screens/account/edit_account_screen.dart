import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

class EditAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    InputDecoration _buildDecoration(String label) => InputDecoration(
          labelText: label,
          contentPadding: const EdgeInsets.only(left: 16, bottom: 8, top: 8),
        );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Editar conta'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          TextField(
            decoration: _buildDecoration("Nome: *"),

            // name.length <6 nome inválido
          ),
          TextField(
            decoration: _buildDecoration('Telefone *'),
            keyboardType: TextInputType.phone,
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
              TelefoneInputFormatter(),
            ],
          ),
          TextField(
            decoration: _buildDecoration('Senha:'),
            obscureText: true,
          ),
          TextField(
            decoration: _buildDecoration('Repita a Senha: '),
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
