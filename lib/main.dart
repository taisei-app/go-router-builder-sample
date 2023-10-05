import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:routing_sample/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'main.g.dart';

@riverpod
SharedPreferences sharedPreference(SharedPreferenceRef ref) =>
    throw UnimplementedError();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  final container = ProviderContainer(
    overrides: [
      sharedPreferenceProvider.overrideWithValue(prefs),
    ],
  );

  // 利用規約が更新されているかのチェック
  final result = await isUpdateTermsStatus();

  if (result) {
    // 利用規約が更新されていたらshouldShowTermsを更新して利用規約画面に飛ばす
    await container
        .read(sharedPreferenceProvider)
        .setBool("shouldShowTerms", true);
  }

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

Future<bool> isUpdateTermsStatus() async => Future.value(false);
