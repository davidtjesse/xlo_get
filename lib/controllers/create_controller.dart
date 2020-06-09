import 'package:get/get.dart';
import 'dart:io';

class CreateController extends GetController {
  List images = [];

  void addImage(File file) {
    images.add(file);
    update(this);
  }

  void removeAt(index){
    images.removeAt(index);
    update(this);
  }
}
