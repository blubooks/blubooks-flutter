import 'package:flutter/material.dart';
import './screen/auth_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bluebooks/src/repository/auth_repository.dart';

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //AuthRepository.loadToken(ref);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const AuthScreen(),
    );
  }
}
