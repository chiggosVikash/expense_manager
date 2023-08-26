import 'package:expense_manager/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BillImageView extends ConsumerWidget {
  const BillImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: (){

      },
      child: Container(
        width: context.width,
        height: context.height*.3,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme
              .secondaryContainer
              .withOpacity(.3)
        ),
        child: const Center(child: Icon(Icons.image),)
      ),
    );
  }
}
