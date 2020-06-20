import 'package:flutter/material.dart';
import 'package:xlo_get/models/ad.dart';

class UserPanel extends StatelessWidget {
  UserPanel(this.ad);
  final Ad ad;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Text(
            'Anunciante',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'David Jesse',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Na XLO desde hoje',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ],
    );
  }
}
