import 'package:cin_hub/controller/loginController.dart';
import 'package:cin_hub/main.dart';
import 'package:cin_hub/static/MaterialColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../static/color.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();
  String? addMail = sharedPref!.getString("adress");
  String? pass = sharedPref!.getString("password");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 25,
                        color: CompanyColors.colorYellow,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Please login to continue",
                      style: TextStyle(
                        color: primaryColorLight,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: mail,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(20),
                        hintText: "Adress mail",
                        prefixIcon: const Icon(Icons.mail),
                        filled: true,
                        fillColor: primaryColorLight,
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
                          prefixIcon: const Icon(Icons.password),
                          filled: true,
                          fillColor: primaryColorLight,
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
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        if (pass == password.text && addMail == mail.text) {
                          sharedPref!.setString("id", "1");
                          Get.offAllNamed("/home");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(MediaQuery.of(context).size.width, 0),
                        padding: const EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: primaryColorLight,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't you have an account ? ",
                          style: TextStyle(
                            color: primaryColorLight,
                          ),
                        ),
                        GestureDetector(
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                              color: primaryColorLight,
                            ),
                          ),
                          onTap: () => Get.toNamed("/signup"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
    ;
  }
}
