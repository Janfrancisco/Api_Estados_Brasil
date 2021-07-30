import 'package:api_getx_estados_br/app/data/model/states_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  List<DropdownMenuItem<StateBRModel>> _dropdownMenuItems;
  StateBRModel _selectedItem;
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Estados Brasileiros'),
        ),
        body: GetX<HomeController>(
          initState: (state) {
            Get.find<HomeController>().getAll();
          },
          builder: (_) {
            _dropdownMenuItems = buildDropDownMenuItems(_.obj);
            _selectedItem = _.item;
            if (_.obj.length < 1) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 12, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Selecione a UF para ver as suas cidades'),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 8),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<StateBRModel>(
                            items: _dropdownMenuItems,
                            value: _selectedItem,
                            onChanged: (value) {
                              print(value.id);
                              _.item = value;
                              _.getAllCounties(value.id.toString());
                              scrollToTop();
                            },
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all()),
                      ),
                      _.counties.length > 1
                          ? Expanded(
                              child: ListView.builder(
                              controller: _scrollController,
                              itemCount: _.counties.length,
                              itemBuilder: (ctx, index) {
                                return ListTile(
                                  title: Text(_.counties[index].nome),
                                );
                              },
                            ))
                          : Container()
                    ],
                  ),
                ),
              );
            }
          },
        ));
  }

  //método responsável por posicionar a lista no inicio, após selecionar o Estado
  scrollToTop() {
    _scrollController.animateTo(1,
        duration: Duration(seconds: 2), curve: Curves.easeIn);
  }

  //transforma a lista de StateBRModel em uma lista DropdownMenuUtem
  List<DropdownMenuItem<StateBRModel>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<StateBRModel>> items = [];
    for (StateBRModel listItem in listItems) {
      items.add(DropdownMenuItem(
        child: Text(listItem.nome),
        value: listItem,
      ));
    }
    return items;
  }
}
