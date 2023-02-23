import 'package:get/get.dart';

class DetailController extends GetxController {
  bool isTaped = false;
  void like() {
    isTaped = !isTaped;
    update();
  }
}
