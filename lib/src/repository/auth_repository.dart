import 'package:bluebooks/src/model/token_model.dart';
import 'package:bluebooks/src/screen/signin_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../model/user_model.dart';
import '../model/error_model.dart';
import 'dart:convert';
import '../service/request_service.dart';
import 'dart:io';

class TokenRepoitory extends StateNotifier<TokenModel?> {
  TokenRepoitory(this.ref) : super(null);
  final Ref ref;

  Future<ErrorModel?> login(UserLoginForm form) async {
    final serverResponse =
        await jsonPost('/auth/login', jsonEncode(UserLoginForm.toJson(form)));

    if (serverResponse.error != null) {
      return serverResponse.error;
    }
    var test = jsonDecode(serverResponse.body);
    TokenModel token = TokenModel.fromJson(test);
    await _saveToken(token);
    state = token;
    return null;
  }

  Future<void> logout() async {
    await _deleteToken();
    state = null;
    /*
    final serverResponse =
        await jsonPost('/auth/login', jsonEncode(UserLoginForm.toJson(form)));

    if (serverResponse.error != null) {
      return serverResponse.error;
    }
    var test = jsonDecode(serverResponse.body);
    TokenModel token = TokenModel.fromJson(test);
    await _saveToken(token.accessToken, token.refreshToken);
    state = token;
    return null;
    */
  }

  static Future<void> _saveToken(TokenModel token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('accessToken', token.accessToken);
    await prefs.setString('refreshToken', token.refreshToken);
  }

  static Future<void> _deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('accessToken');
    await prefs.remove('refreshToken');
  }

  Future<void> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var accessToken = prefs.getString('accessToken');
    var refreshToken = prefs.getString('refreshToken');

    if (accessToken == null || refreshToken == null) {
      return;
    }

    state = TokenModel(accessToken: accessToken, refreshToken: refreshToken);
  }

  Future<ServerResponse> jsonPost(String api, String postData) async {
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };

    if (state != null) {
      headers[HttpHeaders.authorizationHeader] = "Barer ${state!.accessToken}";
    }

    final response = await http.post(Uri.parse('$url$api'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: postData);

    return ServerResponse(response.statusCode, response.body);
  }

  Future<ServerResponse> jsonGet(String api) async {
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };

    if (state != null) {
      headers[HttpHeaders.authorizationHeader] = "Barer ${state!.accessToken}";
    }

    final response = await http.get(Uri.parse('$url$api'), headers: headers);

    return ServerResponse(response.statusCode, response.body);
  }

  void dispose() {}
}
