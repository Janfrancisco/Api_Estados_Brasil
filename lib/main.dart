import 'package:api_getx_estados_br/app/app_bindings.dart';
import 'package:api_getx_estados_br/app/modules/home/home_page.dart';
import 'package:api_getx_estados_br/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    initialBinding: HomeBinding(),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}
