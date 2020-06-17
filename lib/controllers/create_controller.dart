import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:xlo_get/api/api_postal_code.dart';
import 'package:xlo_get/models/address.dart';

final String defaultAddressHint = 'Antes, preencha o CEP, depois\n'
    'revise o endereço. Complete manualmente,\n'
    'caso estejam faltando algum dado (número,\ncomplemento, etc)';

final String failAddressHint = 'Falha ao obter o endereço pelo VIACEP\n'
    'preencha os dados manualmente.';

class CreateController {
  FocusNode addressFocusNode = FocusNode();

  TextEditingController cepController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  StringX addressInfo = '$defaultAddressHint'.obs;
  ListX pictures = [].obs;

  BoolX isCreateButtonEnabled = false.obs;
  BoolX enableCreateWidgets = true.obs;
  BoolX hasCompleteCepData = false.obs;

  StringX titleTextError = 'O título é obrigatório'.obs;
  StringX descriptionTextError = 'A descrição é obrigatória'.obs;
  StringX cepTextError = 'O CEP é obrigatório'.obs;

  bool isValidTitle = false;
  bool isValidDescription = false;
  bool isValidCEP = false;

  String lastValidCEP = '';

  //to rescue data if has.
  Map<String, dynamic> apiData;

  // add a new picture in the list pictures
  void addPicture(File file) {
    pictures.add(file);
  }

  // remove picture from the list
  void removePictureAt(index) {
    pictures.removeAt(index);
  }

  void onChangeTitle(String t) {
    String result;

    if (t.isEmpty) {
      result = 'O título é obrigatório';
      isValidTitle = false;
    } else if (t.trim().length < 5) {
      result = 'Título muito curto';
      isValidTitle = false;
    } else {
      result = null;
      isValidTitle = true;
    }

    if (titleTextError.value != result) {
      titleTextError.value = result;
      checkFormValidation();
    }
  }

  void onChangeDescription(String t) {
    String result;

    if (t.isEmpty) {
      result = 'A descrição é obrigatória';
      isValidDescription = false;
    } else if (t.trim().length < 5) {
      result = 'Descrição muito curta';
      isValidDescription = false;
    } else {
      result = null;
      isValidDescription = true;
    }

    if (descriptionTextError.value != result) {
      descriptionTextError.value = result;
      checkFormValidation();
    }
  }

  void checkErrText(String errText) {
    if (cepTextError.value != errText) {
      cepTextError.value = errText;
      checkFormValidation();
    }
  }

  void onChangeCEP(String t) {
    if (t.isEmpty) {
      checkErrText('O CEP é obrigatório');
      isValidCEP = false;
    } else if (t.trim().length < 10) {
      checkErrText('Digite um CEP válido');
      isValidCEP = false;
    } else {
      checkErrText(null);
      /*prevent typing fail excess*/
      t = t.substring(0, 10);
      if (lastValidCEP != t) {
        checkErrText('Verificando CEP, aguarde...');
        executeApi(t);
      } else
        processApiData(t);
    }
  }

  Future<void> executeApi(String cep) async {
    lastValidCEP = cep;
    apiData = await getAddressFromAPI(cep);
    processApiData(cep);
  }

  void processApiData(cep) {
    if (apiData['address'] != null) {
      // if the zip code exists
      Address address = apiData['address'];
      checkErrText(null);
      addressController.text = '${address.place}, ${address.district}\n'
          '${address.city} - ${address.federativeUnit}\nCEP ${address.postalCode}';
      isValidCEP = true;
    } else if (apiData['err'] == cepApiErrCode.ERR_INVALID_CEP) {
      // if the cep (zip code) does not exist
      checkErrText('O CEP $cep não existe!');
      addressController.text = '';
      isValidCEP = false;
    } else {
      // executed when api connection fail
      isValidCEP = false;
      cepTextError.value = 'Falha de conexão com VIACEP';
      lastValidCEP = '';

      Get.defaultDialog(
        title: 'Falha ao conexão com o VIACEP',
        middleText: 'Tentar novamente ou preencher manualmente o endereço?',
        textConfirm: 'Tentar novamente',
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.back();
          executeApi(cep);
        },
        textCancel: 'Preencher manualmente',
        onCancel: () {
          isValidCEP = true;
          Get.back();
          addressInfo.value = failAddressHint;
          addressFocusNode.requestFocus();
        },
      );
    }
  }

  void checkFormValidation() {
    if (isValidTitle && isValidDescription && isValidCEP)
      print('formulário validado');
  }
}
