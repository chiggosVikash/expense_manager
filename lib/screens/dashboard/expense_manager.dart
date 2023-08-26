import 'package:expense_manager/extensions/media_query_extension.dart';
import 'package:expense_manager/providers/dashboard_manager/dashboard_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/dashboard_models/monthly_expense_model.dart';
import '../../models/dashboard_models/yearly_expense_model.dart';
import '../homepage/drawer_view.dart';
import 'last_added_expense.dart';
import 'model.dart';
import 'dart:ui' as ui;
import 'monthly_expense_chart.dart';
import 'today_expense_amt_by_category_nd_subcategory.dart';
import 'today_nd_total_expene.dart';
import 'top_three_expense_category.dart';
import 'year_wise_expense_chart.dart';

class ExpenseManagerDashboard extends ConsumerStatefulWidget {
  static const routeAddress = "/expenseManagerDashboard";
  const ExpenseManagerDashboard({super.key});

  @override
  ConsumerState<ExpenseManagerDashboard> createState() => _ExpenseManagerDashboardState();
}

class _ExpenseManagerDashboardState extends ConsumerState<ExpenseManagerDashboard> {


  @override
  void initState() {
    super.initState();
    // monthlyExpenseData = [
    //   MonthlyExpenseModel(expenseAmount: 20000.0,month: "Apr"),
    //   MonthlyExpenseModel(expenseAmount: 20000.0,month: "May"),
    //   MonthlyExpenseModel(expenseAmount: 20000.0,month: "Jun"),
    //   MonthlyExpenseModel(expenseAmount: 20000.0,month: "Jul"),
    //   MonthlyExpenseModel(expenseAmount: 20000.0,month: "Aug"),
    // ];

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerView(),
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: Consumer(
        builder: (context,ref,child) {
          final dashboardData = ref.watch(dashboardManagerProvider);
          return dashboardData.when(data: (dashboard){
            return RefreshIndicator(
              onRefresh: ref.read(dashboardManagerProvider.notifier).refreshPage,
              child: ListView(
                children: [
                  TopThreeExpenseCategory(top3CategoriesExpenses: dashboard.top3Categories,),
                  TodayExpenseAmtByCategoryNdSubcategory(todayExpenses: dashboard.todayExpenseCategories,),
                  SizedBox(height: context.height*.02,),
                  MonthlyExpenseChart(monthlyExpenseData: dashboard.monthlyExpense,),
                  TodayNdTotalExpenseAmt(todayExpensesAmount: dashboard.todayExpenseAmount,currentMonthExpenseAmount: dashboard.currentMonthExpenseAmount,),
                  SizedBox(height: context.height*.02,),

                  LastAddedExpense(lastExpense: dashboard.lastAddedExpense,),

                  SizedBox(height: context.height*.02,),
                  YearlyExpenseChart(yearlyExpenseData:dashboard.yearlyExpenses,),


                ],),
            );
          }, error: (e,st)=> Center(child:  Text("Error $e"),),
              loading: ()=> const Center(child: CircularProgressIndicator(),));

        }
      ),);
  }
}
