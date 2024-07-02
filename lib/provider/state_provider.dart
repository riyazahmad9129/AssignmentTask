import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


import '../model/dropdown_model.dart';
import '../server.dart';

class StateProvider with ChangeNotifier {
  final List<DropdownModel> _districtList = [];
   List<DropdownModel> get districtList => _districtList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Future<String?> get(String s) async {
    try {
         (await ServerRequest().multipartGet("state"));
notifyListeners();
      return null;
      

    } catch (e) {
      return e.toString();

    }
  }
  Future<String?> getDistrict( ) async {
    try {
      (await ServerRequest().multipartGet("district"));

      return null;

    } catch (e) {
      return e.toString();

    }
  }
}

























