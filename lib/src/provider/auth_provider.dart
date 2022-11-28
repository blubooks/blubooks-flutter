import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/token_model.dart';

class TokenState extends StateNotifier<TokenModel> {
  TokenState(this.ref)
      : super(const TokenModel(accessToken: "", refreshToken: "")) {}
  final Ref ref;
}

final tokenProvider = StateNotifierProvider<TokenState, TokenModel>((ref) {
  return TokenState(ref);
});

final userTokenProvider = StateProvider<String>((ref) => "");

/*
final userToken = StateProvider<String>(
  // We return the default sort type, here name.
  (ref) => ref.read(tokenProvider).accessToken,
);
*/

/*
final repositoryProvider = Provider((ref) => Repository(ref));

class Repository {
  Repository(this.ref);

  /// The `ref.read` function
  final Ref ref;

  Future<Catalog> fetchCatalog() async {
    String token = ref.read(tokenProvid);

    final response = await dio.get('/path', queryParameters: {
      'token': token,
    });

    return Catalog.fromJson(response.data);
  }
}

*/