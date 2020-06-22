import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:xlo_get/models/ad.dart';
import 'package:xlo_get/screens/products/widgets/botton_bar.dart';
import 'package:xlo_get/screens/products/widgets/description_panel.dart';
import 'package:xlo_get/screens/products/widgets/location_panel.dart';
import 'package:xlo_get/screens/products/widgets/mainPanel.dart';
import 'package:xlo_get/screens/products/widgets/user_panel.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen(this.ad);

  final Ad ad;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anúncio'),
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Container(
                height: 280,
                child: Carousel(
                  images: ad.images.map((f) => FileImage(f)).toList(),
                  dotSize: 4,
                  dotSpacing: 15,
                  dotColor: Colors.pink,
                  dotBgColor: Colors.transparent,
                  autoplay: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MainPanel(ad),
                    Divider(),
                    DescriptionPanel(ad),
                    Divider(),
                    LocationPanel(ad),
                    Divider(),
                    UserPanel(ad),
                    SizedBox(
                      height: 102,
                    ),
                  ],
                ),
              ),
            ],
          ),
          BottomBar(ad),
        ],
      ),
    );
  }
}
