import 'dart:ui';

import 'package:expense_manager/dialogs/confirmation_dialogue.dart';
import 'package:expense_manager/extensions/date_format_extension.dart';
import 'package:expense_manager/extensions/media_query_extension.dart';
import 'package:expense_manager/extensions/theme_extension.dart';
import 'package:expense_manager/models/expense_model.dart';
import 'package:expense_manager/providers/expense_manager/expense_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpenseView extends ConsumerWidget {
  final ExpenseModel _expense;
  const ExpenseView({
    required ExpenseModel expense,
    Key? key,
  }) :_expense = expense, super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      clipBehavior: Clip.none,
      children: [

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            constraints: BoxConstraints(
              minHeight: context.height*.2,
              maxHeight: double.infinity,
              minWidth: double.infinity,
              maxWidth: double.infinity
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Theme.of(context).colorScheme.secondaryContainer,
                Theme.of(context).colorScheme.secondaryContainer.withOpacity(.5),
              ]
                
              ),
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(context.width * .1),
                  topRight: Radius.circular(context.width * .1),
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              /// We are showing data in column
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// View of sub - category
                  Text("Expense On - ${_expense.subCategory}",style: context.themeData.textTheme.titleMedium,),
                  /// View of category
                  Text("\u{20B9}${_expense.amount}",style: context.themeData.textTheme.titleLarge),
                ],),

                  /// Display text of category
                  Text(_expense.category,style: context.themeData.textTheme.bodySmall,),

                /// Display text of date
                Text(_expense.date.formatDate,style: context.themeData.textTheme.bodySmall,),

                  Text("Expense By - ${_expense.expenseBy}",style: context.themeData.textTheme.bodySmall,),

                  /// Display text of date
                  Row(
                    children: [
                      Text("Note - ${_expense.note ?? " "}",style: context.themeData.textTheme.bodySmall,),
                    ],
                  ),


              ],),
            ),
          ),
        ),
        Positioned(
            top: context.height*.14,
            left: context.width*.84,
            child: Card(
              child: Row(children: [
                IconButton(onPressed: (){
                  _showDeleteConfirmationDialogue(context,ref);
                }, icon: const Icon(Icons.delete)),
                ///TODO: Will add later
                // IconButton(onPressed: (){}, icon: const Icon(Icons.edit)),
                // IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_circle_right)),
              ],),
            )),
      ],
    );
  }

  void _showDeleteConfirmationDialogue(BuildContext context,WidgetRef ref){
    showDialog(context: context, builder: (context){
      return ConfirmationDialogue(dialogueTitle: "Delete Confirmation",
          body: "Are you sure want to delete !!",
          yesAction: (){
            ref.read(expenseManagerProvider.notifier).deleteExpenses(expenseId: _expense.modelId);
          },
          noAction: (){
          });
    });
  }
}