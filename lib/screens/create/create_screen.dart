import 'package:flutter/material.dart';
import 'package:xlo_get/common/custom_drawer/custom_drawer.dart';
import 'package:xlo_get/controllers/create_controllers.dart';
import 'package:xlo_get/screens/create/widgets/images_field.dart';

class CreateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CreateController createController = CreateController();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Criar Anúncio'),
      ),
      drawer: CustomDrawer(),
      body: ListView(
        children: <Widget>[
          ImagesField(createController),
          Container(
            height: 50,
            child: RaisedButton(
              color: Colors.pink,
              child: Text(
                'Enviar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
