// Informa o ponto em que o estudo parou

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoppedAt {
  int _stoppedAtLesson = 19;

  notImplementedMsg() => Get.defaultDialog(
      title: 'Metodo ainda não implementado',
      middleText: 'WIP: aula $_stoppedAtLesson ...',
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back();
      });
}
