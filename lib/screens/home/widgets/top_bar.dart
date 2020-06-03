import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xlo_get/screens/filter/filter_screen_stl.dart';
import 'package:xlo_get/screens/home/widgets/bar_button.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey[400],
          blurRadius: 20,
          offset: Offset(0, 2),
        )
      ]),
      child: Row(
        children: <Widget>[
          BarButton(
            label: 'Categorias',
            boxDecoration: BoxDecoration(
              color: Colors.white,
            ),
            onPressed: () {
              Get.to(FilterScreenStl());
            },
          ),
          BarButton(
            label: 'Filtros',
            boxDecoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                left: BorderSide(
                  color: Colors.grey[400],
                ),
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
