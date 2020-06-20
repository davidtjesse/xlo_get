import 'package:flutter/material.dart';
import 'package:xlo_get/models/ad.dart';

class LocationPanel extends StatelessWidget {
  const LocationPanel(this.ad);
  final Ad ad;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Padding(
          padding: const EdgeInsets.only(top: 18, bottom: 18),
          child: const Text(
            'Localização',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const <Widget>[
                  Text('CEP'),
                  SizedBox(
                    height: 12,
                  ),
                  Text('Município'),
                  SizedBox(
                    height: 12,
                  ),
                  Text('Bairro/Distrito')
                ],
                //        ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(ad.address.postalCode),
                  SizedBox(
                    height: 12,
                  ),
                  Text(ad.address.city),
                  SizedBox(
                    height: 12,
                  ),
                  Text(ad.address.district)
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
