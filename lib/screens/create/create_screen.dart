import 'package:brasil_fields/formatter/real_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:xlo_get/api/api_postal_code.dart';
import 'package:xlo_get/common/cep_field.dart';
import 'package:xlo_get/common/custom_drawer/custom_drawer.dart';
import 'package:xlo_get/common/my_input_field_title.dart';
import 'package:xlo_get/controllers/create_controller.dart';
import 'package:xlo_get/screens/create/widgets/images_field.dart';

class CreateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CreateController _createController = CreateController();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Criar Anúncio'),
      ),
      drawer: CustomDrawer(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: <Widget>[
          ImagesField(_createController),
          myInputFieldTitle('Título'),
          SizedBox(height: 4),
          Obx(
            () => TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  errorText: _createController.titleTextError.value,
                ),
                onChanged: _createController.onChangeTitle,
                enabled: _createController.enableCreateWidgets.value),
          ),
          SizedBox(height: 12),
          myInputFieldTitle('Descrição'),
          SizedBox(height: 4),
          Obx(
            () => TextField(
                maxLines: null,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  errorText: _createController.descriptionTextError.value,
                ),
                onChanged: _createController.onChangeDescription,
                enabled: _createController.enableCreateWidgets.value),
          ),
          SizedBox(height: 12),
          myInputFieldTitle('CEP'),
          Obx(
            () => cepField(
                InputDecoration(
                  border: const OutlineInputBorder(),
                  errorText: _createController.cepTextError.value,
                ),
                _createController),
          ),
          SizedBox(height: 16),
          Obx(() => Text(_createController.ender.value)),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Preço *',
              labelStyle: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.grey,
                fontSize: 18,
              ),
              contentPadding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
            ),
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
              signed: false,
            ),
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
              RealInputFormatter(centavos: true),
            ],
            validator: (text) {
              if (text.isEmpty) return 'campo obrigatório';
              if (double.tryParse(text) == null)
                return 'Utilize valores válidos';
              return null;
            },
            onSaved: (price) {},
          ),
          Container(
            height: 50,
            child: RaisedButton(
              color: Colors.pink,
              child: Text(
                'Enviar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () async{
                var rt = await

                getAddressFromAPI(_createController.cepController.text);
print('RT => ${rt['address'].city}');
                },
            ),
          ),
        ],
      ),
    );
  }
}
