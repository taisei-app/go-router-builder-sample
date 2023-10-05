import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routing_sample/main.dart';
import 'package:routing_sample/navigation/router.dart';

class StartPage extends ConsumerWidget {
  const StartPage({super.key});

  static const pagePath = "start";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("スタート画面"),
            ElevatedButton(
              onPressed: () async {
                // ログインが完了したと仮定
                await ref
                    .read(sharedPreferenceProvider)
                    .setBool("isLoggedIn", true);
                if (context.mounted) const HomeRoute().pushReplacement(context);
              },
              child: const Text("ホーム画面"),
            ),
          ],
        ),
      ),
    );
  }
}
