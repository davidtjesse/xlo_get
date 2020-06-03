import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xlo_get/screens/base/base_screen.dart';

// v-268

void main() {
  runApp(GetMaterialApp(
    title: 'XLO Clone - GET',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: BaseScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
