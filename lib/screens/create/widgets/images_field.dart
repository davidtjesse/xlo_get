import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'image_source_sheet.dart';
import 'package:xlo_get/controllers/create_controller.dart';

class ImagesField extends StatelessWidget {
  ImagesField(this.createController);

  final CreateController createController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey[200],
          height: 140,
          child: Obx(
            () => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: createController.pictures.length + 1,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (index == createController.pictures.length) {
                        imageSourceSheet((file) {
                          if (file != null) createController.addPicture(file);
                        });
                      } else {
                        Get.defaultDialog(
                            title: "Excluir imagem",
                            content: Column(
                              children: <Widget>[
                                Image.file(createController.pictures[index]),
                                Text('\nTem certeza que quer excluir?')
                              ],
                            ),
                            confirmTextColor: Colors.white,
                            onConfirm: () {
                              Get.back();
                              createController.removePictureAt(index);
                            },
                            onCancel: () {});
                      }
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 16, top: 16, bottom: 16),
                      child: index ==
                              createController
                                  .pictures.length
                          ? CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              radius: 52,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.camera_alt,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    '+ inserir',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            )
                          : CircleAvatar(
                              radius: 52,
                              backgroundImage:
                                  FileImage(createController.pictures[index]),
                            ),
                    ),
                  );
                }),
          ),
        ),
        Obx(
          () => Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              alignment: Alignment.centerLeft,
              child: createController.pictures.length == 0
                  ? Text(
                      'É obrigatório adicionar imagens',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    )
                  : null),
        ),
      ],
    );
  }
}
