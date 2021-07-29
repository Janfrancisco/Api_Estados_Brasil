import 'package:api_getx_estados_br/app/data/model/counties_model.dart';
import 'package:api_getx_estados_br/app/data/model/states_model.dart';
import 'package:api_getx_estados_br/app/data/repository/repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final MyRepository repository;
  HomeController(this.repository);
  StateBRModel initial;

  final _obj = List<StateBRModel>().obs;
  final _item = StateBRModel().obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
  set item(value) => this._item.value = value;
  get item => this._item.value;

  final _counties = List<CountiesModel>().obs;
  set counties(value) => this._counties.value = value;
  get counties => this._counties.value;

  Future getAll() async {
    await repository.getAll().then((data) {
      obj = data;
      item = data[0];
    });
  }

  Future getAllCounties(String id) async {
    await repository.getAllCounties(id).then((data) {
      counties = data;
    });
  }
}
