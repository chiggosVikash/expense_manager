import 'package:expense_manager/databases/setup/objectbox_storage.dart';
import 'package:expense_manager/extensions/media_query_extension.dart';
import 'package:expense_manager/providers/dashboard_manager/dashboard_manager.dart';
import 'package:expense_manager/screens/add_expense_screen/add_expense_screen.dart';
import 'package:expense_manager/screens/dashboard/data_not_found_msg.dart';
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
    // ObjectBoxStore().expenseBox.removeAll();
    // ObjectBoxStore().settingBox.removeAll();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerView(),
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: Stack(
        children: [
          Container(color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(.4),),
          Consumer(
            builder: (context,ref,child) {
              final dashboardData = ref.watch(dashboardManagerProvider);
              return dashboardData.when(data: (dashboard){
                if(dashboard.lastAddedExpense == null){
                  return const DataNotFound();
                  // return Center(child: Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                    // const Text("You have not added any expenses Please add Atleast one data"),
                    // ElevatedButton(onPressed: (){
                    //   Navigator.pushNamed(context, AddExpenseScreen.routeAddress);
                    // }, child: const Text("Add Expense")),
                    // ElevatedButton(onPressed: (){
                    //   ref.read(dashboardManagerProvider.notifier).refreshPage();
                    // }, child: const Text("Refresh Page"))
                  // ],),);
                }
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
          ),
        ],
      ),);
  }
}
