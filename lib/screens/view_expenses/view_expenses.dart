

import 'package:expense_manager/screens/dashboard/expense_manager.dart';
import 'package:expense_manager/screens/view_expenses/expense_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/expense_manager/expense_manager.dart';
import '../homepage/homepage.dart';

class ViewExpensesScreen extends ConsumerWidget {
  static const routeAddress = "/viewExpensesScreen";
  const ViewExpensesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenses = ref.watch(expenseManagerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Expenses"),
      actions: [
        IconButton(onPressed: (){
          Navigator.pushNamedAndRemoveUntil(context, ExpenseManagerDashboard.routeAddress, (route) => false);
        }, icon: const Icon(Icons.home_filled))
      ],
      ),
      body: expenses.isEmpty
          ?
      const Center(child: Text("Data not found :("),)
          :
      ListView.builder(
          itemCount: expenses.length,
          itemBuilder: (context,index){
            return ExpenseView(expense: expenses[index]);
      }),
    );
  }
}
