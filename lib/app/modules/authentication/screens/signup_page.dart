import 'package:api_getx_estados_br/app/core/size_config.dart';
import 'package:api_getx_estados_br/app/modules/authentication/controller.dart';
import 'package:api_getx_estados_br/app/modules/authentication/screens/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  /* SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white)); */
  bool _isObscurePassword = true;
  bool _isObscureRePassword = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  final _myFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("Aspect ratiio: $size.aspectRatio");

    return LayoutBuilder(builder: (context, constraint) {
      SizeConfig().init(constraint);
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.white,
        ),
        child: Scaffold(
          body: ListView(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.off(WelcomePage(),
                            transition: Transition.fadeIn, opaque: true);
                      },
                      icon: Icon(Icons.arrow_back)),
                  Text(
                    'Cadastro',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.textMultiplier * 6),
                  )
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.person,
                    size: SizeConfig.blockHorizontal * 46,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                ),
                child: Form(
                  key: _myFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Campo Obrigatório";
                          }
                          return null;
                        },
                        decoration: InputDecoration(hintText: "Nome"),
                      ),
                      SizedBox(height: SizeConfig.blockVertical * 1.5),
                      TextFormField(
                        controller: surnameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Campo Obrigatório";
                          }
                          return null;
                        },
                        decoration: InputDecoration(hintText: "Sobrenome"),
                      ),
                      SizedBox(height: SizeConfig.blockVertical * 1.5),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Campo Obrigatório";
                          }
                          return null;
                        },
                        decoration: InputDecoration(hintText: "E-mail"),
                      ),
                      SizedBox(height: SizeConfig.blockVertical * 1.5),
                      TextFormField(
                        controller: passwordController,
                        obscureText: _isObscurePassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Campo Obrigatório";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Senha",
                          suffixIcon: IconButton(
                            color: Colors.black,
                            icon: Icon(_isObscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _isObscurePassword = !_isObscurePassword;
                                print(_isObscurePassword);
                              });
                            },
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockVertical * 1.75),
                      TextFormField(
                        onChanged: (value) {
                          if (passwordController.text.length < 6) {}
                        },
                        controller: rePasswordController,
                        obscureText: _isObscureRePassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Campo Obrigatório";
                          } else if (value.length < 6) {
                            return "A senha deve conter no mínimo 6 caracteres";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: "Confirmar Senha",
                          suffixIcon: IconButton(
                            color: Colors.black,
                            icon: Icon(_isObscureRePassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _isObscureRePassword = !_isObscureRePassword;
                                print(_isObscurePassword);
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: SizeConfig.blockVertical * 5,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    )),
                                onPressed: () {
                                  print('onpress');
                                  String name = nameController.text;
                                  String surname = surnameController.text;
                                  String email = emailController.text;
                                  String password = passwordController.text;
                                  String rePassword = rePasswordController.text;

                                  /* if (password != rePassword) {
                                      Get.snackbar(
                                          "Erro", 'As senhas não coincidem!');
                                      return null;
                                    } */
                                  if (_myFormKey.currentState.validate()) {
                                    if (password == rePassword) {
                                      print('onpress1');
                                      Get.find<AuthController>().createUser(
                                          name, surname, email, password);
                                    } else {
                                      Get.snackbar(
                                          'Erro', 'As senhas não coincidem');
                                    }
                                  }
                                },
                                child: Text(
                                  'Realizar cadastro',
                                  style: TextStyle(color: Colors.grey[200]),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
