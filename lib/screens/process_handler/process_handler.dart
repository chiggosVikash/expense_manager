import 'package:expense_manager/loding_indicators/in_processing_indicator.dart';
import 'package:expense_manager/loding_indicators/process_failed_indicator.dart';
import 'package:expense_manager/loding_indicators/process_succeed_indicator.dart';
import 'package:expense_manager/providers/add_expense_provider/add_expense_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../enums/action_enum.dart';
@immutable
class ProcessHandlerArgs{
  final ActionEnum action;
  final VoidCallback successAction;
  final VoidCallback failedAction;
  final String successButtonTitle;

  const ProcessHandlerArgs({required this.failedAction,required this.successAction,required this.action,required this.successButtonTitle});
}

class ProcessHandler extends ConsumerWidget {
  static const  routeAddress = "/processHandler";
  final ProcessHandlerArgs _args;
  const ProcessHandler({
    Key? key,
   required ProcessHandlerArgs args,
  }) :_args = args, super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body:Consumer(builder: (context,ref,child){
        if(_args.action == ActionEnum.addExpense){
          final status = ref.watch(addExpensePProvider);
          if(status.value == 1){
            return ProcessSucceed(action: (){
              Navigator.pop(context);

              _args.successAction();
            }, actionTitle:_args.successButtonTitle);
          }else if (status.value == -1){
            return const Center(child: InProcessingIndicator(),);
          }
          return ProcessFailedIndicator(failedReason: "Error In save Expense", action: (){
            Navigator.pop(context);
            _args.failedAction();
          });
        }

        return Container();
      },)
    );
  }
}
