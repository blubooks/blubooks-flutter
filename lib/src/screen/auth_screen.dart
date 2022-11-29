import 'package:bluebooks/src/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screen/home_screen.dart';
import '../screen/signin_screen.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  build(BuildContext context, WidgetRef ref) {
    final token = ref.watch(authStateProvider);
    debugPrint("build AuthScreen");

    return (token != null) ? const HomeScreen() : SignInScreen();
    /*
    final isLoggedIn = ref.watch(authStateChangesProvider);
    return isLoggedIn.maybeWhen(
        data: (loggedIn) => loggedIn ? const HomeScreen() : SignInScreen(),
        orElse: () => Scaffold(
              appBar: AppBar(),
              body: const Center(child: CircularProgressIndicator()),
            ));

  */
  }
}
