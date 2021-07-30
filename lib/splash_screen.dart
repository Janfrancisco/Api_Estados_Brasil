import 'package:api_getx_estados_br/app/modules/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Artboard _riveArtboard;
  RiveAnimationController _controller;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/new_file.riv').then(
      (data) async {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;

        artboard.addController(_controller = SimpleAnimation('Animation 1'));
        _controller.isActiveChanged
          ..addListener(() {
            if (!_controller.isActive) {
              Future.delayed(Duration(seconds: 2), () {
                Get.off(HomePage());
              });
            }
          });
        setState(() {
          _riveArtboard = artboard;
          _controller.isActive = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: _riveArtboard == null
              ? const SizedBox()
              : Rive(artboard: _riveArtboard),
        ),
      ),
    );
  }
}
