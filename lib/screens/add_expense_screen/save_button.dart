import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SaveExpenseButton extends ConsumerWidget {
  final VoidCallback onSave;
  const SaveExpenseButton({
    required this.onSave,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  ElevatedButton(style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        minimumSize: Size(MediaQuery.of(context).size.width*.4, MediaQuery.of(context).size.height*.045)),
        onPressed: onSave,
          child: const Text("Save"));
  }
}
