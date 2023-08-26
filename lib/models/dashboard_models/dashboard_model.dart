

import 'package:expense_manager/models/dashboard_models/category_wise_expense_model.dart';
import 'package:expense_manager/models/expense_model.dart';
import 'package:flutter/foundation.dart';

import 'monthly_expense_model.dart';
import 'yearly_expense_model.dart';

@immutable
class DashboardModel{
  final List<CategoryWiseExpenseModel> top3Categories;
  final List<CategoryWiseExpenseModel> todayExpenseCategories;
  final List<MonthlyExpenseModel> monthlyExpense;
  final List<YearlyExpenseModel> yearlyExpenses;

  final double todayExpenseAmount;
  final double currentMonthExpenseAmount;
  final ExpenseModel? lastAddedExpense;

  const DashboardModel({required this.lastAddedExpense,
  required this.monthlyExpense,
    required this.todayExpenseAmount,
    required this.todayExpenseCategories,
    required this.top3Categories,
    required this.currentMonthExpenseAmount,
    required this.yearlyExpenses
  });




}