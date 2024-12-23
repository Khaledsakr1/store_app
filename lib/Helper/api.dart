import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      try {
        return jsonDecode(response.body);
      } catch (e) {
        print('Error decoding JSON: $e');
        print('Response body: ${response.body}');
        throw Exception('Invalid JSON response');
      }
    } else {
      throw Exception(
          'Error in GET request, statusCode: ${response.statusCode}, body: ${response.body}');
    }
  }

  Future<dynamic> post(
      {required String url,
      required dynamic body,
      String? token}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: headers,
    );

    if (response.statusCode == 200) {
      try {
        return jsonDecode(response.body);
      } catch (e) {
        print('Error decoding JSON: $e');
        print('Response body: ${response.body}');
        throw Exception('Invalid JSON response');
      }
    } else {
      throw Exception(
          'Error in POST request, statusCode: ${response.statusCode}, body: ${response.body}');
    }
  }

  Future<dynamic> put(
      {required String url,
      required dynamic body,
      String? token}) async {
    Map<String, String> headers = {
    'Content-Type': 'application/json',
    };

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    print('url = $url body = $body token $token');
    http.Response response = await http.put(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: headers,
    );

    if (response.statusCode == 200) {
      try {
        return jsonDecode(response.body);
      } catch (e) {
        print('Error decoding JSON: $e');
        print('Response body: ${response.body}');
        throw Exception('Invalid JSON response');
      }
    } else {
      throw Exception(
          'Error in PUT request, statusCode: ${response.statusCode}, body: ${response.body}');
    }
  }
}


















/*

Future<dynamic> get({required String url, @required String? token}) async {
    
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({});
    }
    http.Response response = await http.get(Uri.parse(url) , headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'There was an error in statusCode ${response.statusCode}');
    }
  }
  */