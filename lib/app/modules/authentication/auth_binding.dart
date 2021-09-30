import 'package:api_getx_estados_br/app/data/provider/firebase_provider.dart';
import 'package:api_getx_estados_br/app/data/repository/user_repository.dart';
import 'package:api_getx_estados_br/app/modules/authentication/controller.dart';
import 'package:get/get.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
        () => AuthController(UserRepository(ApiFirebase())));
  }
}
