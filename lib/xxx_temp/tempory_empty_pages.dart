/* Gera  páginas para testes -
 Excluir a pasta qdo não for mais necessária */

import 'package:flutter/material.dart';
import 'package:xlo_get/common/custom_drawer/custom_drawer.dart';

class TemporaryPage extends StatelessWidget {
  TemporaryPage(this.page);

  final int page;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina $page'),
      ),
      body: Container(
        color: page == 2
            ? Colors.green
            : page == 3
                ? Colors.deepOrange
                : page == 4 ? Colors.yellow : Colors.lightBlue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Esta é a página $page\n\n Use o drawer para navergar entre elas.',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
      drawer: CustomDrawer(),
    );
  }
}
