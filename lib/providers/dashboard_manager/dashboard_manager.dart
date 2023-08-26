
import 'dart:ui'as ui;

import 'package:expense_manager/databases/query/dashboard_query.dart';
import 'package:expense_manager/extensions/date_format_extension.dart';
import 'package:expense_manager/extensions/only_date_extension.dart';
import 'package:expense_manager/models/dashboard_models/category_wise_expense_model.dart';
import 'package:expense_manager/models/dashboard_models/dashboard_model.dart';
import 'package:expense_manager/models/dashboard_models/monthly_expense_model.dart';
import 'package:expense_manager/models/dashboard_models/yearly_expense_model.dart';
import 'package:expense_manager/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../databases/query/ldb_query.dart';
import '../../interface/dashboard_manager_interface.dart';
part 'dashboard_manager.g.dart';
@riverpod
class DashboardManager extends _$DashboardManager with DashboardQuery,LDBQuery implements DashboardManagerInterface {

  final _firstYearShed = ui.Gradient.linear(const Offset(20, 50), const Offset(50, 80),[ Colors.indigo.withOpacity(.1),
    Colors.indigo.withOpacity(.2)]);

  final _secYearShed = ui.Gradient.linear(const Offset(20, 50), const Offset(50, 80),
      [
        Colors.purple.withOpacity(.1),
        Colors.purple.withOpacity(.2)
      ]
  );


  DashboardModel _valueInitilizer(){
    final currentMonthExpense = currentMonthExpenseAmount();
    final lastAddedExpenseData = lastAddedExpense();
    final monthlyWiseExpenses = monthWiseExpense();
    final todayExpense = todayExpenseAmount();
    final yearlyExpense = yearlyExpenses();
    final todayExpenseCato = todayExpenseCategory();
    final top3Category = top3ExpenseCategory();


    return DashboardModel(
      lastAddedExpense: lastAddedExpenseData,
      monthlyExpense: monthlyWiseExpenses,
      todayExpenseAmount: todayExpense,
      todayExpenseCategories: todayExpenseCato,
      top3Categories: top3Category,
      currentMonthExpenseAmount: currentMonthExpense,
      yearlyExpenses: yearlyExpense,

    );
  }

  @override
  FutureOr<DashboardModel> build(){
    return _valueInitilizer();

  }

  Future<void> refreshPage()async{
    state = AsyncValue.data(_valueInitilizer());
  }

  @override
  double currentMonthExpenseAmount() {
    final currentMonth = DateTime.now().dateMonth;
    final monthlyExpenses = monthWiseExpense();
    final matchedMonthData = monthlyExpenses.where((element) => element.month == currentMonth);
    if(matchedMonthData.isNotEmpty){
      return matchedMonthData.first.amount;
    }
    return 0.0;


  }

  @override
  ExpenseModel? lastAddedExpense() {
    final expenses = getExpenses();
    if(expenses.isEmpty){
      return null;
    }
    return expenses[0];
  }

  @override
  List<MonthlyExpenseModel> monthWiseExpense() {
    var monthlyExpensesData = <MonthlyExpenseModel>[];
    final currentYearExpenses = currentYearExpensesQ();

    for(var exp in currentYearExpenses){
      final month = exp.date.month;
      final monthData = MonthlyExpenseModel(amount: exp.amount, month: month);
      final matchedData = monthlyExpensesData.where((element) => element == monthData);
      if(matchedData.isNotEmpty){
        matchedData.first.amount+= monthData.amount;
      }else{
        monthlyExpensesData.add(monthData);
      }
    }
    return monthlyExpensesData;
  }

  @override
  double todayExpenseAmount() {
    final todayExpenses = todayExpenseQ();
    final amount = todayExpenses.fold(0.0, (previousValue, element) => previousValue+element.amount);
    return amount;
  }

  @override
  List<CategoryWiseExpenseModel> todayExpenseCategory() {
    List<CategoryWiseExpenseModel> todayExpensesData = [];
    final todayExpenses = todayExpenseQ();

    for(var exp in todayExpenses){
      final categoryData = CategoryWiseExpenseModel(category: exp.category, amount: exp.amount);
      if(todayExpensesData.contains(categoryData)){
        final matchedCategory = todayExpensesData.where((element) => element == categoryData).toList();
        matchedCategory[0].amount += categoryData.amount;
      }else{
        todayExpensesData.add(categoryData);
      }
    }
    return todayExpensesData;

  }

  @override
  List<YearlyExpenseModel> yearlyExpenses() {
    final yearlyExpensesData =  yearlyExpensesQ();
    if(yearlyExpensesData.length < 2){
      return yearlyExpensesData;
    }
    final firstYearData = yearlyExpensesData[0];
    firstYearData.shader = _firstYearShed;
    final secYearData = yearlyExpensesData[1];
    secYearData.shader = _secYearShed;
    return [firstYearData,secYearData];
  }


  @override
  List<CategoryWiseExpenseModel> top3ExpenseCategory() {
    final categoriesExpenses = categoryExpensesQ();
    categoriesExpenses.sort((a,b)=>b.amount.compareTo(a.amount));
    if(categoriesExpenses.length <= 3){
      return categoriesExpenses;
    }
    return [categoriesExpenses[0],categoriesExpenses[1],categoriesExpenses[2]];
  }



}