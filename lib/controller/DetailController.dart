import 'package:get/get.dart';

class DetailController extends GetxController {
  bool isTaped = false;
  bool isSelected = false;
  void like() {
    isTaped = !isTaped;
    update();
  }

  void selected() {
    isSelected = !isSelected;
    update();
  }
}
