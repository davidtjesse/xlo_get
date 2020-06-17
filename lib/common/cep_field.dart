import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xlo_get/controllers/create_controller.dart';

Widget cepField(final InputDecoration decoration,
        final CreateController createController) =>
    Column(
      children: <Widget>[
        TextField(
          keyboardType: TextInputType.number,
          controller: createController.cepController,
          inputFormatters: [
            WhitelistingTextInputFormatter.digitsOnly,
            CepInputFormatter(),
          ],
          decoration: decoration,
          onChanged: createController.onChangeCEP,
          enabled: createController.enableCreateWidgets.value,
        ),
      ],
    );
