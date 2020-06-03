import 'package:get/get.dart';

class HomeTitleController extends GetController {
  String title = '';

  void setTitle(String newTitle) {
    title = newTitle;

    update(this);
  }
}
