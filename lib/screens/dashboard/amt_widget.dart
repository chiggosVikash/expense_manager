import 'package:expense_manager/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class ExpenseAmtWidget extends StatelessWidget {
  final BoxConstraints constraints;
  const ExpenseAmtWidget({super.key,required this.constraints});

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red.withOpacity(.1)
        ),
        padding: EdgeInsets.symmetric(vertical: context.height*.003,horizontal: constraints.biggest.width*.02,),
        margin: EdgeInsets.only(right: context.width*.04),
        child: Text.rich(TextSpan(children: [
          TextSpan(text: "\u20B9 "),
          TextSpan(text: "2000.0")
        ])),
      ),
    )
    ;
  }
}
