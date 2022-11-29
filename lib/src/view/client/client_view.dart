import 'package:bluebooks/src/model/client_model.dart';
import 'package:bluebooks/src/provider/provider.dart';
import 'package:bluebooks/src/service/request_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClientView extends ConsumerWidget {
  const ClientView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /*
    final test = ref.read(authStateProvider.notifier).jsonGet('/cients');
      final error = await provider.login(UserLoginForm(
                      email: email.text, password: password.text));
*/

    debugPrint("build HomeScreen");
    return Scaffold(
      appBar: AppBar(
        title: Text('Client'),
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
      body: Center(child: Builder(builder: (context) {
        AsyncValue<List<ClientModel>> list = ref.watch(clientListProvider);

        return list.when(
          loading: () => const CircularProgressIndicator(),
          error: (err, stack) => Text('Error: $err'),
          data: (entries) {
            return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(entries[index].title),
                    trailing: Icon(Icons.more_vert),
                  );
                });
          },
        );
      })),
    );
  }
}
