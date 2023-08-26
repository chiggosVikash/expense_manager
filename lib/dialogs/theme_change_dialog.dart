import 'package:expense_manager/app_theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShowThemeChangeDialog extends ConsumerWidget {
  ShowThemeChangeDialog({
    Key? key,
  }) : super(key: key);
  var _groupValue = -1;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeManagerProvider);
    _groupValue = theme == ThemeMode.light ? 0 : theme == ThemeMode.dark ? 1 : 2;
    return AlertDialog(
      title: Text("App Theme",
        style: Theme.of(context).textTheme.titleLarge,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,

        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RadioListTile(
              title: const Text("Light"),
              value: 0, groupValue: _groupValue, onChanged: (value){
            ref.read(themeManagerProvider.notifier).switchTheme(mode: ThemeMode.light);
          }),
          RadioListTile(
              title: const Text("Dark"),
              value: 1, groupValue: _groupValue, onChanged: (value){
            ref.read(themeManagerProvider.notifier).switchTheme(mode: ThemeMode.dark);
          }),
          RadioListTile(
              title: const Text("System Default"),
              value: 2, groupValue: _groupValue, onChanged: (value){
                ref.read(themeManagerProvider.notifier).switchTheme(mode: ThemeMode.system);
          }),
        ],
      ),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: const Text("Ok")),
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: const Text("Cancel")),
      ],
    );
  }


}