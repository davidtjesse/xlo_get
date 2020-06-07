import 'package:flutter/material.dart';
import 'package:xlo_get/common/custom_drawer/custom_drawer.dart';
import 'package:xlo_get/screens/create/widgets/images_field.dart';

class CreateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Criar Anúncio'),
      ),
      drawer: CustomDrawer(),
      body: ListView(
        children: <Widget>[
          ImagesField(),
        ],
      ),
    );
  }
}
