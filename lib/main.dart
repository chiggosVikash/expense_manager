import 'package:expense_manager/app_theme/theme_manager.dart';
import 'package:expense_manager/databases/setup/objectbox_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_theme/theme_setting.dart';
import 'screen_route/screen_route.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ObjectBoxStore().create();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final route = ScreenRoute();
    return Consumer(
      builder: (context,ref,child) {
        final themeMode = ref.watch(themeManagerProvider);
        return MaterialApp(
          title: 'Expense Manager',
          onGenerateRoute: route.onGenerateRoute,
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
        );
      }
    );
  }
}
