import 'package:bluebooks/src/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view/client/client_view.dart';

/// Simple account screen showing some user info and a logout button.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("build HomeScreen");
    final navi = ref.watch(naviProvider);
    if (navi == Navi.clients) {
      return ClientView();
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Account'),
          actions: [
            TextButton(
              onPressed: () {
                ref.read(authStateProvider.notifier).logout();
              },
              child: Text(
                'Logout',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      );
    }
  }
/*
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("build HomeScreen");
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        actions: [
          TextButton(
            onPressed: () {
              ref.read(authStateProvider.notifier).logout();
            },
            child: Text(
              'Logout',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
  */
}
