import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login_task/provider/log_out.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServerRequest {
  final String baseUrl = "https://stgnandghar.dhwaniris.in/index.php/api/";

  Future<http.Response> post(String url, dynamic postData) async {
    Uri uri = Uri.parse("$baseUrl$url");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var header = {
      "Content-Type": "application/json",
      if (token != null) "Authorization": "Bearer $token",
    };
    http.Response response =
        await http.post(uri, headers: header, body: jsonEncode(postData));
    if (response.statusCode != 200 && response.statusCode != 201) {
      var jsonResponse = jsonDecode(response.body);
      throw Exception(jsonResponse['message'] ??
          "Error: Status Code ${response.statusCode}");
    }
    return response;
  }

  Future<String> multipartLogin(String username, String password) async {
    const String baseUrl = "https://stgnandghar.dhwaniris.in/index.php/api/";
    Uri uri = Uri.parse("${baseUrl}common-user-login/login");
    var request = http.MultipartRequest('POST', uri);
    request.fields['username'] = username;
    request.fields['password'] = password;

    http.StreamedResponse streamedResponse = await request.send();

    if (streamedResponse.statusCode == 200) {
      String responseBody = await streamedResponse.stream.bytesToString();
      Map<String, dynamic> jsonResponse = jsonDecode(responseBody);
      print(jsonResponse);
      String? token = jsonResponse["nandghar"]['token_nandghar'];
      if (token == null) {
        throw Exception("Login error");
      }
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString('token', token);
      return responseBody;
    } else {
      throw Exception('Failed to login: ${streamedResponse.statusCode}');
    }
  }

  Future<String> multipartGet(String path) async {
    const String baseUrl = "https://stgnandghar.dhwaniris.in/index.php/api/";
    Uri uri = Uri.parse("${baseUrl}master/get-district");

    var request = http.Request('GET', uri);
    request.headers.addAll(request.bodyFields);

    http.StreamedResponse streamedResponse = await request.send();
    print(request.body);

    if (streamedResponse.statusCode == 200) {
      String responseBody = await streamedResponse.stream.bytesToString();
      Map<String, dynamic> jsonResponse = jsonDecode(responseBody);
      print(jsonResponse);

      return responseBody;
    } else {
      throw Exception('Failed : ${streamedResponse.statusCode}');
    }
  }

  void logoutUser(BuildContext context) async {
    var authProvider = Provider.of<AuthProvider>(context, listen: false);

    var headers = {
      'token': authProvider.authToken ?? '',
    };
    var uri = Uri.parse(
        'https://stgnandghar.dhwaniris.in/index.php/api/common-user-login/logout');
    try {
      var response = await http.get(
        uri,
        headers: headers,
      );
      if (response.statusCode == 200) {
        authProvider.clearAuthToken();
        print('Logged out successfully');
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<http.Response> getData(String url) async {
    const String baseUrl = "https://stgnandghar.dhwaniris.in/index.php/api/";
    Uri uri = Uri.parse("${baseUrl}master/get-district");


    var headers = {
      "Content-Type": "application/json",
    };

    try {
      http.Response response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        return response;
      } else {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        throw Exception(jsonResponse['message'] ??
            "Error: Status Code ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
      rethrow; // Rethrow the exception to be handled by the caller
    }
  }
}
