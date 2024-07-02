import 'dart:convert';


import 'package:shared_preferences/shared_preferences.dart';

import '../model/dropdown_model.dart';
import 'package:http/http.dart' as http;

class MyDropdown1 {
  Future<List<DropdownModel>> getApi(String path) async {
    List<DropdownModel> data = [];
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      var header = {
        "Content-Type": "application/json",
        if (token != null) "Authorization": "Bearer $token",
      };
      final request =  http.MultipartRequest("GET",Uri.parse(
          "https://stgnandghar.dhwaniris.in/index.php/api/$path"),);
      request.headers.addAll({"token": token!});

      final response =  await request.send();
      if (response.statusCode == 200) {

        var jsondata = jsonDecode(await response.stream.bytesToString());
        print(jsondata);
        List<dynamic> dataList = jsondata['district'] ?? [];
        return  dataList.map((e) => DropdownModel.fromMap(e)).toList();
      }
    } catch (e) {
      print(e);
    }
    return [];
  }
}
