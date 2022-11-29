import 'package:bluebooks/src/model/error_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/provider.dart';

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
    } else {
      error = null;
    }
  }
}

class RequestService {
  static Future<ServerResponse> jsonPost(
      Ref ref, String api, String postData) async {
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };

    var token = ref.read(authStateProvider);

    if (token != null) {
      headers[HttpHeaders.authorizationHeader] = "Barer ${token.accessToken}";
    }

    final response = await http.post(Uri.parse('$url$api'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: postData);

    return ServerResponse(response.statusCode, response.body);
  }
}
