import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


import '../server.dart';

class LoginProvider with ChangeNotifier {
  Future<String?> login(String username, String password) async {
    try {
      String response = await ServerRequest().multipartLogin(username, password);

      return null;

    } catch (e) {
      return e.toString();

    }
  }
}
