import 'package:get/get.dart';

class LoginController extends GetxController {
  bool isObscure = false;
  bool isObscureC = false;
  void showPassword() {
    isObscure = !isObscure;
    update();
  }

  void showPasswordC() {
    isObscureC = !isObscureC;
    update();
  }
}
