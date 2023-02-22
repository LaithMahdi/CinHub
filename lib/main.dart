import 'package:cin_hub/auth/login.dart';
import 'package:cin_hub/auth/signup.dart';
import 'package:cin_hub/screen/home.dart';
import 'package:cin_hub/static/MaterialColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'middleware/authMiddleware.dart';

SharedPreferences? sharedPref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CinHub',
      theme: ThemeData(
        primarySwatch: CompanyColors.colorYellow,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: "/", page: () => const Login(), middlewares: [
          Auth_Middleware(),
        ]),
        GetPage(name: "/signup", page: () => const SignUp()),
        GetPage(name: "/home", page: () => const Home()),
      ],
    );
  }
}
