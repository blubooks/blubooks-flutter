import 'package:bluebooks/src/model/token_model.dart';
import 'package:bluebooks/src/provider/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../model/user_model.dart';
import '../model/error_model.dart';
import 'dart:convert';
import '../service/server.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(ref));

class AuthRepository {
  AuthRepository(this.ref);

  /// The `ref.read` function
  final Ref ref;

  Future<ErrorModel?> login(UserLoginForm form) async {
    final serverResponse = await Server.post(
        '/auth/login', jsonEncode(UserLoginForm.toJson(form)));

    if (serverResponse.error != null) {
      return serverResponse.error;
    }

    TokenModel token = TokenModel.fromJson(jsonDecode(serverResponse.body));
    await _saveToken(token.accessToken, token.refreshToken);

    ref.read(tokenProvider.notifier).setToken(token);

    return null;
  }

  Future<void> _saveToken(String accessToken, String refreshToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', accessToken);
    await prefs.setString('refreshToken', refreshToken);
  }

  Future<TokenModel?> _loadToken(
      String accessToken, String refreshToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var accessToken = prefs.getString('accessToken');
    var refreshToken = prefs.getString('refreshToken');

    if (accessToken == null || refreshToken == null) {
      return null;
    }

    return TokenModel(accessToken: accessToken, refreshToken: refreshToken);
  }

/*
  Future<Catalog> fetchCatalog() async {
    String token = ref.read(tokenProvid);

    final response = await dio.get('/path', queryParameters: {
      'token': token,
    });

    return Catalog.fromJson(response.data);
  }
  */
}

/*
class AuthRepository {
  static Future<void> signIn(ref) async {
    var login = "test";

    await saveToken(login);

    ref.read(loggedIn.notifier).state = login;
  }

  static Future<void> loadToken(ref) async {
    final token = await getToken();
    ref.read(loggedIn.notifier).state = token;
  }

  static Future<void> logout(ref) async {
    await removToken();
    ref.read(loggedIn.notifier).state = null;
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('jwt');
  }

  static saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt', token);
  }

  static removToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwt');
  }
}

final loggedIn = StateProvider<String?>((ref) => "");
*/