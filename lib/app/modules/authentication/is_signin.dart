import 'package:api_getx_estados_br/app/modules/authentication/controller.dart';
import 'package:api_getx_estados_br/app/modules/authentication/screens/welcome_page.dart';
import 'package:api_getx_estados_br/app/modules/home/home_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class IsSignIn extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return controller.user != null ? HomePage() : WelcomePage();
  }
}
