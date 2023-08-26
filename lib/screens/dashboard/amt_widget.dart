import 'package:expense_manager/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class ExpenseAmtWidget extends StatelessWidget {
  final BoxConstraints constraints;
  final double _amount;
  const ExpenseAmtWidget({super.key,required this.constraints,
  required double amount
  }):_amount = amount;

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
          const TextSpan(text: "\u20B9 "),
          TextSpan(text: "$_amount")
        ])),
      ),
    )
    ;
  }
}
