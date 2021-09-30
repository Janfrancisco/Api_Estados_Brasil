import 'package:api_getx_estados_br/app/data/provider/api.dart';
import 'package:api_getx_estados_br/app/data/repository/repository.dart';
import 'package:api_getx_estados_br/app/modules/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    print('HomeBinding');
    Get.lazyPut<HomeController>(
      () => HomeController(
        MyRepository(api: MyApiClient(httpClient: http.Client())),
      ),
    );
  }
}
