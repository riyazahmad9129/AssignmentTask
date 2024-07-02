import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../model/dropdown_model.dart';

class Drop1 extends StatelessWidget {
  final String hint ;
  const Drop1({super.key, required this.hint});
  Future<List<DropdownModel>> getApi(String path) async {
    List<DropdownModel> data = [];
    try {
      data = [
        DropdownModel(id: "1", name: "Male"),
        DropdownModel(id: "2", name: "Female"),
        DropdownModel(id: "3", name: "Other"),
      ];
      await Future.delayed(const Duration(seconds: 2),);
    } catch (e) {
      print(e);
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0,right: 30,top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownSearch<DropdownModel>(
            asyncItems: (st) => getApi("gender"),
            itemAsString: (DropdownModel u) => u.name ?? "",
            onChanged: (DropdownModel? data) => print(data),
            dropdownDecoratorProps:  DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10,top: 8),
                hintText: hint,
                hintStyle: TextStyle(fontSize: 25,color: Colors.grey),

              ),
            ),
          )
        ],
      ),

    );
  }
}
