import 'dart:convert';
import 'package:api_getx_estados_br/app/data/model/counties_model.dart';
import 'package:api_getx_estados_br/app/data/model/states_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

const baseUrl =
    'https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome';

class MyApiClient {
  final http.Client httpClient;
  MyApiClient({@required this.httpClient});

  getAll() async {
    try {
      var response = await httpClient.get(baseUrl);
      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body);
        List<StateBRModel> listMyModel =
            jsonResponse.map((model) => StateBRModel.fromJson(model)).toList();
        return listMyModel;
      } else
        print('erro in api.getAll');
    } catch (_) {}
  }

  getAllCounties(String id) async {
    //id = id;
    try {
      var response = await httpClient.get(
          'https://servicodados.ibge.gov.br/api/v1/localidades/estados/${id}/distritos?orderBy=nome');
      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body);
        List<CountiesModel> listMyModel =
            jsonResponse.map((model) => CountiesModel.fromJson(model)).toList();
        return listMyModel;
      } else
        print('erro in api.getAllCounties');
    } catch (_) {}
  }
}
