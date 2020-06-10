import 'package:get/get.dart';
import 'dart:io';

class CreateController {
  ListX pictures = [].obs;

  void addPicture(File file) {
    pictures.add(file);
  }

  void removeAt(index) {
    pictures.removeAt(index);
  }
}
