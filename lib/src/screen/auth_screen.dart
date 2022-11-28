import 'package:bluebooks/src/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/auth_repository.dart';
import '../screen/home_screen.dart';
import '../screen/signin_screen.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(userTokenProvider);
    return (authState == "") ? SignInScreen() : const HomeScreen();
  }
}
