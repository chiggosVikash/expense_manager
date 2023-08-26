import 'package:expense_manager/extensions/media_query_extension.dart';
import 'package:flutter/material.dart';
import 'last_added_expense.dart';
import 'model.dart';
import 'dart:ui' as ui;
import 'monthly_expense_chart.dart';
import 'today_expense_amt_by_category_nd_subcategory.dart';
import 'today_nd_total_expene.dart';
import 'top_three_expense_category.dart';
import 'year_wise_expense_chart.dart';

class ExpenseManagerDashboard extends StatefulWidget {
  static const routeAddress = "/expenseManagerDashboard";
  const ExpenseManagerDashboard({super.key});

  @override
  State<ExpenseManagerDashboard> createState() => _ExpenseManagerDashboardState();
}

class _ExpenseManagerDashboardState extends State<ExpenseManagerDashboard> {

  late List<MonthlyExpenseModel> monthlyExpenseData ;
  late List<YearlyExpenseModel> yearlyExpense;

  @override
  void initState() {
    super.initState();
    monthlyExpenseData = [
      MonthlyExpenseModel(expenseAmount: 20000.0,month: "Apr"),
      MonthlyExpenseModel(expenseAmount: 20000.0,month: "May"),
      MonthlyExpenseModel(expenseAmount: 20000.0,month: "Jun"),
      MonthlyExpenseModel(expenseAmount: 20000.0,month: "Jul"),
      MonthlyExpenseModel(expenseAmount: 20000.0,month: "Aug"),
    ];

    yearlyExpense = [
      YearlyExpenseModel(year: "2022", expenseAmount: 500000.0,
      shader: ui.Gradient.linear(Offset(20, 50), Offset(50, 80), [
        Colors.indigo.withOpacity(.1),
        Colors.indigo.withOpacity(.2)
      ])),
      YearlyExpenseModel(
      shader: ui.Gradient.linear(Offset(20, 50), Offset(50, 80), [
      Colors.purple.withOpacity(.1),
      Colors.purple.withOpacity(.2)
      ]),
     year: "2023", expenseAmount: 100000.0),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: ListView(
        children: [
          const TopThreeExpenseCategory(),
          const TodayExpenseAmtByCategoryNdSubcategory(),
          SizedBox(height: context.height*.02,),
          MonthlyExpenseChart(monthlyExpenseData: monthlyExpenseData,),
          const TodayNdTotalExpenseAmt(),
          SizedBox(height: context.height*.02,),

          const LastAddedExpense(),

          SizedBox(height: context.height*.02,),
          YearlyExpenseChart(yearlyExpenseData: yearlyExpense,),


        ],),);
  }
}
