import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:xlo_get/api/api_postal_code.dart';

class CreateController {
  TextEditingController cepController = TextEditingController();

  StringX ender = "aguardando...".obs;
  ListX pictures = [].obs;

  BoolX isCreateButtonEnabled = false.obs;
  BoolX enableCreateWidgets = true.obs;

  StringX titleTextError = 'O título é obrigatório'.obs;
  StringX descriptionTextError = 'A descrição é obrigatória'.obs;
  StringX cepTextError = 'O CEP é obrigatório'.obs;

  bool isValidTitle = false;
  bool isValidDescription = false;
  bool isValidCEP = false;

  String lastValidCEP = '';

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

  Future<void> onChangeCEP(String t) async {
    String result;

    if (t.isEmpty) {
      result = 'O CEP é obrigatório';
      isValidCEP = false;
    } else if (t.trim().length < 10) {
      result = 'Digite um CEP válido';
      isValidCEP = false;
    } else {
      result = null;

      if (lastValidCEP != t) {
        ender.value = 'Verificando CEP, aguarde...';
        lastValidCEP = t;
        var z = await getAddressFromAPI(t);
        if (z['address'] != null)
          ender.value = z.toString();
        else
          ender.value = z['msg'];
      }
      isValidCEP = true;
    }

    if (cepTextError.value != result) {
      cepTextError.value = result;

      checkFormValidation();
    }
  }

  void processCEPResult(result) {}

  void checkFormValidation() {
    if (isValidTitle && isValidDescription && isValidCEP)
      print('formulário validado');
  }
}
