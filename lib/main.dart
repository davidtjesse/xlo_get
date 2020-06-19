import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [Locale('pt', 'BR')],
    debugShowCheckedModeBanner: false,
  ));
}
