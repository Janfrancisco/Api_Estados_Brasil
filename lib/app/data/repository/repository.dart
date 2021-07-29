import 'package:api_getx_estados_br/app/data/provider/api.dart';
import 'package:flutter/cupertino.dart';

class MyRepository {
  final MyApiClient api;

  MyRepository({@required this.api}) : assert(api != null);

  getAll() {
    return api.getAll();
  }

  getAllCounties(String id) {
    return api.getAllCounties(id);
  }
}
