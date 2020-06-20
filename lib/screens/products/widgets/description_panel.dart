import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xlo_get/models/ad.dart';

class DescriptionPanel extends StatelessWidget {
  const DescriptionPanel(this.ad);
  final Ad ad;

  @override
  Widget build(BuildContext context) {
    BoolX open = false.obs;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 18),
          child: Text(
            'Descrição',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Obx(
          () => Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 18),
                child: Text(
                  ad.description,
                  maxLines: open.value ? 100 : 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              if (open.value || ad.description.length < 100)
                const SizedBox(
                  height: 18,
                )
              else
                Align(
                  alignment: Alignment.centerLeft,
                  child: FlatButton(
                    onPressed: () {
                      open.value = true;
                    },
                    child: Text(
                      'Ver descrição completa',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}
