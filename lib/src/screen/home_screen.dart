import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/auth_repository.dart';
import '../util/async_value.dart';

/// Simple account screen showing some user info and a logout button.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        actions: [
          TextButton(
            onPressed: () {
              //   AuthRepository.logout(ref);
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
