import 'package:brasil_fields/formatter/real_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:xlo_get/common/cep_field.dart';
import 'package:xlo_get/common/custom_drawer/custom_drawer.dart';
import 'package:xlo_get/common/my_input_field_title.dart';
import 'package:xlo_get/controllers/base_screen_page_controller.dart';
import 'package:xlo_get/controllers/create_controller.dart';
import 'package:xlo_get/controllers/data_holder.dart';
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
                controller: _createController.titleController,
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
                controller: _createController.descriptionController,
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
          SizedBox(height: 4),
          Obx(
            () => Visibility(
              visible: _createController.addressInfo.value != '',
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: _createController.addressInfo.value != 'FAIL'
                        ? Colors.pink
                        : Colors.red),
                child: Text(
                  _createController.addressInfo.value != 'FAIL'
                      ? _createController.addressInfo.value
                      : "Não foi possível a conexão com o VIACEP para obter a "
                          "localização. O serviço pode estar indisponível ou "
                          "sobrecarregado nesse momento. Mas pode cadastrar o anúncio "
                          "assim mesmo e tentar obter a localização mais tarde.",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          myInputFieldTitle('Preço'),
          SizedBox(height: 4),
          Obx(
            () => TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  errorText: _createController.priceTextError.value,
                ),
                focusNode: _createController.priceFocusNode,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: false,
                ),
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                  RealInputFormatter(centavos: true),
                ],
                controller: _createController.priceController,
                onChanged: _createController.onChangePrice,
                enabled: _createController.enableCreateWidgets.value),
          ),
          SizedBox(height: 16),
          Obx(
            () => Container(
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
                onPressed: _createController.isCreateButtonEnabled.value
                    ? () {
                        _createController.setAd();
                        DataHolder().adList.add(_createController.ad);
                        BaseScreenPageController().setPage(0);
                      }
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
