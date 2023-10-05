import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routing_sample/main.dart';
import 'package:routing_sample/navigation/router.dart';

class TermsPage extends ConsumerWidget {
  const TermsPage({super.key});

  static const pagePath = "/privacy-policy";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("利用規約画面（初回のみ表示）"),
            ElevatedButton(
              onPressed: () async {
                await ref
                    .read(sharedPreferenceProvider)
                    .setBool("shouldShowTerms", false);
                if (context.mounted) const MainRoute().pushReplacement(context);
              },
              child: const Text("スタート画面へ遷移"),
            ),
          ],
        ),
      ),
    );
  }
}
