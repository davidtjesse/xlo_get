import 'package:flutter/material.dart';
import 'package:xlo_get/common/custom_drawer/widgets/icon_Tile.dart';
import 'package:xlo_get/controllers/base_screen_page_controller.dart';

class IconSection extends StatelessWidget {
  final baseScreenPageController = BaseScreenPageController();

  @override
  Widget build(BuildContext context) {
    int page = baseScreenPageController.getPage();

    return Column(
      children: <Widget>[
        IconTile(
          label: 'Anúncios',
          iconData: Icons.list,
          onTap: () {
            baseScreenPageController.setPage(0);
          },
          highlighted: page == 0,
        ),
        IconTile(
          label: 'Inserir Anúncio',
          iconData: Icons.edit,
          onTap: () {
            baseScreenPageController.setPage(1);
          },
          highlighted: page == 1,
        ),
        IconTile(
          label: 'Chat',
          iconData: Icons.chat,
          onTap: () {
            baseScreenPageController.setPage(2);
          },
          highlighted: page == 2,
        ),
        IconTile(
          label: 'Favoritos',
          iconData: Icons.favorite,
          onTap: () {
            baseScreenPageController.setPage(3);
          },
          highlighted: page == 3,
        ),
        IconTile(
          label: 'Minha conta',
          iconData: Icons.person,
          onTap: () {
            baseScreenPageController.setPage(4);
          },
          highlighted: page == 4,
        ),
      ],
    );
  }
}
