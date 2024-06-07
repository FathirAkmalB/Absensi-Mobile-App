import 'dart:convert';

import 'package:http/http.dart' as http;

String stagingUrl = '';
String testing = 'https://absensi.smktarunabhakti.net:3995';

class ApiURL{
  static String apiUrl = testing;
}

class API { 
  postRequest({
    required String route,
    required Map<String, dynamic> data,
  }) async {
    String apiUrl = '$testing/api';
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
    String apiUrl = '$testing/api';

    String url = apiUrl + route;

    return await http.get(
      Uri.parse(url),
      headers: _header(),
    );
  }

  _header() =>
      {'Content-type': 'application/json', 'Accept': 'application/json'};
}
