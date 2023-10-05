import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ログイン後に表示される画面
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static const pagePath = "home";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ログイン後の画面"),
          ],
        ),
      ),
    );
  }
}
