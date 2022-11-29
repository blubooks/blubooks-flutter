import 'package:bluebooks/src/model/user_model.dart';
import 'package:bluebooks/src/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import '../repository/auth_repository.dart';
import '../util/dialogs.dart';

class SignInScreen extends ConsumerWidget {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  SignInScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final test = ref.watch(loggedIn);
    debugPrint("build SignInScreen");

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Center(
        child: SizedBox(
          width: 200,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: 'Email'),
                controller: email,
              ),
              TextField(
                controller: password,
                obscuringCharacter: "*",
                obscureText: true,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final provider = ref.read(authStateProvider.notifier);
                  final error = await provider.login(UserLoginForm(
                      email: email.text, password: password.text));

                  if (error != null) {
                    CustomDialog.showError(context: context, error: error);
                  }
                  // ServerRequest.getUserLogin(   context, email.text, password.text);
                  /*Ü
                 var test = ref.read(loggedIn).state;
                  ref.read(loggedIn) = "";
                  AuthRepository.signIn(context);
                  */
                  //ref.read(loggedIn.notifier).state = "dfsafasf";
                  // ref.watch(authRepositoryProvider).signIn();
                  //  AuthRepository.signIn(ref);

                  //ref.read(logginChanged.notifier).state = "dfsafasf";
                },
                child: const Text('Sign'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
