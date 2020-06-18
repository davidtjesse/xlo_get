/*Singleton hold list ads */

import 'package:xlo_get/models/ad.dart';

class DataHolder {
  static DataHolder _instance;

  factory DataHolder({List adList}) {
    _instance ??= DataHolder._internalConstructor(adList);
    return _instance;
  }
  DataHolder._internalConstructor(this.adList);

  List<Ad> adList;
}
