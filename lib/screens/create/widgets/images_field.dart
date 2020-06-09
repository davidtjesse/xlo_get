import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'image_source_sheet.dart';
import 'package:xlo_get/controllers/create_controller.dart';

class ImagesField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  CreateController createController = CreateController();
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey[200],
          height: 140,
          child: GetBuilder(
              init: CreateController(),
              builder: (_) {
                CreateController ctrl = _;

                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _.images.length + 1,
                    itemBuilder: (context, index) {
                      //   if (index == _.images.length) {
                      return GestureDetector(
                        onTap: () {
                          if (index == _.images.length) {
                            imageSourceSheet((file) {
                              if (file != null) _.addImage(file);
                            });
                          } else {
                            Get.defaultDialog(
                                title: 'Excluir imagem',
                                middleText: 'Tem certeza disso?',
                                confirmTextColor: Colors.white,
                                onConfirm: () {
                                  Get.back();
                                  ctrl.removeAt(index);
                                },
                                onCancel: () {});
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, top: 16, bottom: 16),
                          child: index == _.images.length
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
                                  backgroundImage: FileImage(_.images[index]),
                                ),
                        ),
                      );
                    });
              }),
        ),
      ],
    );
  }
}
