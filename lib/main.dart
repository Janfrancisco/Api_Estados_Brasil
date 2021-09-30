import 'package:api_getx_estados_br/app/app_bindings.dart';
import 'package:api_getx_estados_br/app/core/size_config.dart';
import 'package:api_getx_estados_br/app/modules/authentication/auth_binding.dart';
import 'package:api_getx_estados_br/app/modules/authentication/screens/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  await Firebase.initializeApp().then((value) {
    print('Check $value');
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, boxConstraints) {
      SizeConfig().init(boxConstraints);
      return GetMaterialApp(
        theme: ThemeData(fontFamily: 'PTSans'),
        initialBinding: AuthBinding(),
        debugShowCheckedModeBanner: false,
        home: WelcomePage(),
      );
    });
  }
}
