import 'package:brasil_fields/formatter/real_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
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
          myInputFieldTitle('Endereço'),
          SizedBox(height: 4),
          Obx(
            () => TextField(
                maxLines: null,
                focusNode: _createController.addressFocusNode,
                controller: _createController.addressController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: _createController.addressInfo.value,
                  //  errorText: _createController.descriptionTextError.value,
                ),
                //  onChanged: _createController.onChangeDescription,
                enabled: _createController.enableCreateWidgets.value),
          ),
          SizedBox(height: 12),
          myInputFieldTitle('Preço'),
          SizedBox(height: 4),
          Obx(
            () => TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  errorText: _createController.descriptionTextError.value,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: false,
                ),
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                  RealInputFormatter(centavos: true),
                ],
                onChanged: _createController.onChangeDescription,
                enabled: _createController.enableCreateWidgets.value),
          ),




          SizedBox(height: 16),


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
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
