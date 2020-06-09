import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

imageSourceSheet(Function(File) onImageSelected) {
  File image;
  final picker = ImagePicker();

  Future getImage(ImageSource imageSource) async {
    final pickedFile = await picker.getImage(source: imageSource);

    if (pickedFile != null) image = File(pickedFile.path);
    onImageSelected(image);
    Get.back();
  }

  Get.bottomSheet(Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      FlatButton(
          child: const Text('Camera'),
          onPressed: () {
            getImage(ImageSource.camera);
          }),
      FlatButton(
          child: const Text('Galeria'),
          onPressed: () {
            getImage(ImageSource.gallery);
          }),
    ],
  ));
}
