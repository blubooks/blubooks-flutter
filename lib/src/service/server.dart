import 'package:bluebooks/src/model/error_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const url = "http://localhost:4070/api/v1";

class ServerResponse {
  late ErrorModel? error;
  late int statusCode;
  final String body;
  ServerResponse(this.statusCode, this.body) {
    if (statusCode < 200 || statusCode >= 300) {
      try {
        error = ErrorResponse.fromJson(jsonDecode(body)).error;
      } catch (e) {
        error = ErrorModel(message: e.toString());
      }
    }
    error = null;
  }
}

class Server {
  static Future<ServerResponse> post(String api, String postData) async {
    Map<ErrorModel?, String> ret = {};
    final response = await http.post(Uri.parse('$url$api'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: postData);

    return ServerResponse(response.statusCode, response.body);
  }
}
