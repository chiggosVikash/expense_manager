import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmationDialogue extends ConsumerWidget {
  final String dialogueTitle;
  final String body;
  final VoidCallback yesAction;
  final VoidCallback noAction;
  const ConfirmationDialogue({
    required this.dialogueTitle,
    required this.body,
    required this.yesAction,
    required this.noAction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text(dialogueTitle,style: Theme.of(context).textTheme.titleLarge,),
      content: Text(body),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
          yesAction();
        }, child: const Text("Yes")),
        TextButton(onPressed: (){
          Navigator.pop(context);
          noAction();
        }, child: const Text("No"))
      ],
    );
  }
}
