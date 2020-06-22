import 'package:flutter/material.dart';
import 'package:xlo_get/common/custom_drawer/custom_drawer.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Minha conta'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {},
            child: const Text(
              'EDITAR',
            ),
            textColor: Colors.white,
          )
        ],
      ),
      drawer: CustomDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 180,
            decoration: BoxDecoration(color: Colors.blue),
            alignment: Alignment.center,
            child: Text(
              'David Jesse',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          ListTile(
            title: Text(
              'Meus anúncios',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'Favoritos',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
