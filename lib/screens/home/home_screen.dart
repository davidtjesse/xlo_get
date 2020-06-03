import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xlo_get/common/custom_drawer/custom_drawer.dart';
import 'package:xlo_get/controllers/home_title_controller.dart';
import 'package:xlo_get/screens/home/widgets/search_dialog.dart';
import 'package:xlo_get/screens/home/widgets/top_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SearchDialog searchDialog = SearchDialog();

    /* executado como callback quando concluida digitação do texto de pesquisa*/
    void searchDone(String search) {

      /* Muda o título do AppBar */
      Get.find<HomeTitleController>().setTitle(search);

      /* TODO - o que fazer com o search? */
    }

    /* inicia a pesquisa quando onPressed */
    void _openSearch(String currentSearch) {
      searchDialog.openSearchDialog(currentSearch, searchDone);
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: GetBuilder(
          init: HomeTitleController(),
          builder: (HomeTitleController homeCtrl) {
            return homeCtrl.title.isEmpty
                ? Text('XLO Clone - GET')
                : GestureDetector(
                    onTap: () => _openSearch(homeCtrl.title),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Container(
                            width: constraints.biggest.width,
                            child: Text(homeCtrl.title));
                      },
                    ),
                  );
          },
        ),
        actions: <Widget>[
          GetBuilder(
              init: HomeTitleController(),
              builder: (HomeTitleController homeCtrl) {
                return homeCtrl.title.isEmpty
                    ? IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          _openSearch('');
                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          searchDone('');
                        },
                      );
              }),
        ],
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: <Widget>[
          TopBar(),
        ],
      ),
    );
  }
}
