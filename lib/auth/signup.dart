import 'package:cin_hub/controller/loginController.dart';
import 'package:cin_hub/main.dart';
import 'package:cin_hub/model/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../static/MaterialColor.dart';
import '../static/color.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController ftName = TextEditingController();
  List<User> userAuth = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.black.withOpacity(0.7),
                    ],
                    begin: Alignment.center,
                    end: Alignment.topCenter,
                    stops: const [0, 1],
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bg.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    const SizedBox(height: 45),
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        child: const Icon(
                          Icons.arrow_back,
                          color: primaryColorLight,
                        ),
                        onTap: () => Get.back(),
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      "Create an account",
                      style: TextStyle(
                          fontSize: 25,
                          color: CompanyColors.colorYellow,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Please Sign up to continue",
                      style: TextStyle(
                        color: primaryColorLight,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 50),
                    TextFormField(
                      controller: ftName,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(20),
                        hintText: "First name",
                        filled: true,
                        fillColor: primaryColorLight,
                        prefixIcon: const Icon(Icons.account_circle),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: primaryColorGrey,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: mail,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(20),
                        hintText: "Adress mail",
                        filled: true,
                        fillColor: primaryColorLight,
                        prefixIcon: const Icon(Icons.mail),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: primaryColorGrey,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GetBuilder<LoginController>(
                      init: LoginController(),
                      builder: (controller) => TextFormField(
                        controller: password,
                        obscureText: controller.isObscure,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20),
                          hintText: "Password",
                          filled: true,
                          fillColor: primaryColorLight,
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: GestureDetector(
                            child: Icon(
                              controller.isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onTap: () => controller.showPassword(),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: primaryColorGrey,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GetBuilder<LoginController>(
                      builder: (controller) => TextFormField(
                        controller: passwordC,
                        obscureText: controller.isObscureC,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20),
                          hintText: "Confirm password",
                          filled: true,
                          fillColor: primaryColorLight,
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: GestureDetector(
                            child: Icon(
                              controller.isObscureC
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onTap: () => controller.showPasswordC(),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: primaryColorGrey,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        sharedPref!.setString("adress", mail.text);
                        sharedPref!.setString("name", ftName.text);
                        sharedPref!.setString("password", password.text);
                        Get.offNamed("/");
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(MediaQuery.of(context).size.width, 0),
                        padding: const EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Create account",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: primaryColorLight,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "you have an account ? ",
                          style: TextStyle(color: primaryColorLight),
                        ),
                        GestureDetector(
                          child: const Text(
                            "Sign in",
                            style: TextStyle(
                              color: primaryColorLight,
                            ),
                          ),
                          onTap: () => Get.toNamed("/"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
