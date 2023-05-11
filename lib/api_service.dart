import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiService extends ChangeNotifier {
  static const String baseUrl =
      'http://ec2-50-19-32-237.compute-1.amazonaws.com:5000/';

  late Map<String, dynamic> _result = {};
  Map<String, dynamic> get data => _result;

  Future<Map<String, dynamic>> postData(Map<String, dynamic> data) async {
    final response = await http.post(Uri.parse('${baseUrl}play'),
        headers: {'Content-Type': 'application/json'}, body: json.encode(data));

    if (response.statusCode == 200) {
      _result = json.decode(response.body);
      print(_result);
      notifyListeners();
      return json.decode(response.body);
    } else {
      throw Exception('Failed to post data');
    }
  }
}
