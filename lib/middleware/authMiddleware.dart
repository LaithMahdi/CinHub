import 'package:cin_hub/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Auth_Middleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (sharedPref!.getString("id") != null)
      return const RouteSettings(name: "/home");
  }
}
