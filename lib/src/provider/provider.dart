import 'dart:convert';

import 'package:bluebooks/src/model/client_model.dart';
import 'package:bluebooks/src/model/token_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/auth_repository.dart';

enum Navi {
  clients,
  today,
  folder,
}

final naviProvider = StateProvider((ref) => Navi.clients);

final authStateProvider =
    StateNotifierProvider<TokenRepoitory, TokenModel?>((ref) {
  return TokenRepoitory(ref);
});

final clientListProvider = FutureProvider<List<ClientModel>>((ref) async {
  final auth = ref.watch(authStateProvider.notifier);
  var response = await auth.jsonGet('/clients');

  return (jsonDecode(response.body) as List)
      .map((p) => ClientModel.fromJson(p))
      .toList();
});




/*

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  /*
  final token = await AuthRepository.getToken();

  final auth = AuthRepository(ref, token);
  ref.onDispose(() {
    return auth.dispose();
  });
  */
  final auth = AuthRepository(ref, null);
  return auth;
});
final authStateChangesProvider = FutureProvider<bool>((ref) async {
  final authRepository = ref.watch(authRepositoryProvider);
  return await authRepository.loggedIn();
});
*/