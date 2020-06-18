import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:xlo_get/api/api_postal_code.dart';
import 'package:xlo_get/helpers/functions.dart';
import 'package:xlo_get/models/ad.dart';

class CreateController {
  Ad ad = Ad();

  FocusNode priceFocusNode = FocusNode();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController cepController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  StringX addressInfo = ''.obs;
  ListX pictures = [].obs;

  BoolX isCreateButtonEnabled = false.obs;
  BoolX enableCreateWidgets = true.obs;

  StringX titleTextError = 'O título é obrigatório'.obs;
  StringX descriptionTextError = 'A descrição é obrigatória'.obs;
  StringX cepTextError = 'O CEP é obrigatório'.obs;
  StringX priceTextError = 'O preço é obrigatório'.obs;

  bool isValidTitle = false;
  bool isValidDescription = false;
  bool isValidCEP = false;
  bool isValidPrice = false;

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
      addressInfo.value = '';
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
      isValidCEP = true;
      checkErrText(null);
      addressInfo.value = getLocationString(apiData['address']);
    } else if (apiData['err'] == cepApiErrCode.ERR_INVALID_CEP) {
      // if the cep (zip code) does not exist
      checkErrText('O CEP $cep não existe!');
      //  addressInfo.value = '';
      isValidCEP = false;
    } else {
      // executed when api connection fail
      isValidCEP = true;
      lastValidCEP = '';

      Get.defaultDialog(
        title: 'Falha de conexão com o VIACEP',
        middleText: 'Tentar novamente novamente ou tentar mais tarde?',
        textConfirm: 'Tentar novamente',
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.back();
          executeApi(cep);
        },
        textCancel: 'Tentar mais tarde',
        onCancel: () {
          priceFocusNode.requestFocus();
          addressInfo.value = 'FAIL';
        },
      );
    }
    checkFormValidation();
  }

  void onChangePrice(String t) {
    String result;

    if (t.isEmpty) {
      result = 'O preço é obrigatório';
      isValidPrice = false;
    } else if (t.trim().length < 4) {
      result = 'Digite um preço válido';
      isValidPrice = false;
    } else {
      result = null;
      isValidPrice = true;
    }

    if (priceTextError.value != result) {
      priceTextError.value = result;
      checkFormValidation();
    }
  }

  void checkFormValidation() {
    // enable button enviar
    isCreateButtonEnabled.value = (isValidTitle &&
        isValidDescription &&
        isValidCEP &&
        isValidPrice &&
        pictures.value.length > 0);
  }

  void setAd() {
    ad.images = pictures.value;
    ad.title = titleController.text;
    ad.description = descriptionController.text;
    ad.address = apiData['address'];
    ad.hidePhone = true;
    ad.price = double.parse(
        priceController.text.replaceAll('.', '').replaceAll(',', '.'));

  }
}
