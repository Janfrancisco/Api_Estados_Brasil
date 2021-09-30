import 'package:api_getx_estados_br/app/core/size_config.dart';
import 'package:api_getx_estados_br/app/data/repository/user_repository.dart';
import 'package:api_getx_estados_br/app/modules/authentication/controller.dart';
import 'package:api_getx_estados_br/app/modules/authentication/screens/signup_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool _isObscure = true;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final AuthController myController = Get.find<AuthController>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(SizeConfig.blockVertical);
    print(SizeConfig.blockHorizontal);

    /* SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(statusBarColor: Colors.greenAccent[400])); */

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.greenAccent[400],
          ),
          backgroundColor: Colors.greenAccent[400],
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                color: Colors.greenAccent[400],
                width: SizeConfig.screenWidth,
                height: 20 * SizeConfig.blockVertical,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    // SizedBox(height: 10 * SizeConfig.blockHorizontal),
                    Positioned(
                      width: 90 * SizeConfig.blockHorizontal,
                      bottom: SizeConfig.blockVertical * 1.5,
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean facilisis nec dui sit amet aliquet.',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 4 * SizeConfig.textMultiplier),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Positioned(
                      bottom: 9.4 * SizeConfig.blockVertical,
                      child: Text(
                        'Bem vindo',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 6 * SizeConfig.textMultiplier,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.blockVertical * 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Campo obrigatório";
                    }
                    return null;
                  },
                  controller: email,
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: 'E-mail',
                      labelStyle: TextStyle(color: Colors.black),
                      contentPadding: EdgeInsets.only(left: 10)),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Campo obrigatório";
                    }
                    return null;
                  },
                  controller: password,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      suffixIcon: IconButton(
                        color: Colors.black,
                        icon: Icon(_isObscure
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                      labelText: 'Senha',
                      labelStyle: TextStyle(color: Colors.black),
                      contentPadding: EdgeInsets.only(left: 10)),
                ),
              ),
              SizedBox(height: SizeConfig.blockHorizontal * 12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.greenAccent[400],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18))),
                  child: Text(
                    'Entrar',
                    style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.textMultiplier * 4),
                  ),
                  onPressed: () {
                    myController.login(email.text, password.text);
                  },
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextButton(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.greenAccent[400]),
                            borderRadius: BorderRadius.circular(18))),
                    child: Text(
                      'Cadastre-se',
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.greenAccent[400],
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.textMultiplier * 4,
                      ),
                    ),
                    onPressed: () async {
                      Get.to(SignUpScreen(), transition: Transition.fadeIn);
                      /* myController.createUser(
                          'name', 'surname', 'email@dre.com', 'password'); */
                    }),
              )
            ],
          ),
        ));
  }
}
