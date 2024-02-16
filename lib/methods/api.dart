import 'dart:convert';

import 'package:http/http.dart' as http;

String stagingUrl = '';
String ngrok = 'https://880b-2001-448a-2020-a7f6-2dc4-70c7-e80b-3267.ngrok-free.app';

class ApiURL{
  static String apiUrl = ngrok;
}

class API {
  postRequest({
    required String route,
    required Map<String, dynamic> data,
  }) async {
    String apiUrl = '$ngrok/api';
    String url = apiUrl + route;

    return await http.post(
      Uri.parse(url),
      body: jsonEncode(data),
      headers: _header(),
    );
  }

  getRequest({
    required String route,
  }) async {
    String apiUrl = '$ngrok/api';

    String url = apiUrl + route;

    return await http.get(
      Uri.parse(url),
      headers: _header(),
    );
  }

  _header() =>
      {'Content-type': 'application/json', 'Accept': 'application/json'};
}
