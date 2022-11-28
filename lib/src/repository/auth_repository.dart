import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../model/user_model.dart';
import '../model/error_model.dart';
import 'dart:convert';

final authRepositoryProvider = Provider((ref) => AuthRepository(ref.read));

class AuthRepository {
  AuthRepository(this.reader);

  /// The `ref.read` function
  final reader;

  Future<ErrorModel?> login(UserLoginForm form) async {
    var test = UserLoginForm.toJson(form);
    final response =
        await http.post(Uri.parse('http://localhost:4070/api/v1/auth/login'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(UserLoginForm.toJson(form)));
    if (response.statusCode != 200) {
      try {
        return ErrorResponse.fromJson(jsonDecode(response.body)).error;
      } catch (e) {
        return ErrorModel(message: e.toString());
      }
    }
    return null;
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