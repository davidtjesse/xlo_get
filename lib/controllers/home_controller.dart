import 'package:get/get.dart';

class HomeController {
  StringX title = ''.obs;

  void setTitle(String newTitle) {
    title.value = newTitle;
  }
}
