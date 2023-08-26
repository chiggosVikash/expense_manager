
import 'dart:ui' as ui;

import 'package:expense_manager/databases/setup/objectbox_storage.dart';
import 'package:expense_manager/extensions/date_format_extension.dart';
import 'package:expense_manager/extensions/only_date_extension.dart';
import 'package:expense_manager/models/expense_model.dart';
import 'package:expense_manager/objectbox.g.dart';
import 'package:flutter/material.dart';
import '../../models/dashboard_models/category_wise_expense_model.dart';
import '../../models/dashboard_models/yearly_expense_model.dart';

mixin class DashboardQuery{

  List<CategoryWiseExpenseModel> categoryExpensesQ(){
    List<CategoryWiseExpenseModel> categoriesExpenses = [];
    final builder = ObjectBoxStore().expenseBox.query().build();
    final allExpenses = builder.find();
    builder.close();
    for(var exp in allExpenses){
      final categoryData = CategoryWiseExpenseModel(category: exp.category, amount: exp.amount);
      if(categoriesExpenses.contains(categoryData)){
        final matchedCategory = categoriesExpenses.where((element) => element == categoryData).toList();
        matchedCategory[0].amount += categoryData.amount;
      }else{
        categoriesExpenses.add(categoryData);
      }
    }

    return categoriesExpenses;

  }


  List<ExpenseModel> _totalExpenses(){
    final queryBuilder = ObjectBoxStore().expenseBox.query().build();
    final expenses = queryBuilder.find();
    queryBuilder.close();
    return expenses;
  }

  List<ExpenseModel> currentYearExpensesQ(){
    final year = DateTime.now().year.toString();
    final query = ObjectBoxStore().expenseBox.query(ExpenseModel_.date.contains(year)).build();
    final currentYearExpenses = query.find();
    query.close();
    return currentYearExpenses;
  }


  List<YearlyExpenseModel> yearlyExpensesQ(){
    final yearlyExpensesData = <YearlyExpenseModel>[];
    final totalExpenses = _totalExpenses();

    for(var exp in totalExpenses){
      final year = exp.date.year;
      final model = YearlyExpenseModel(shader: ui.Gradient.linear(const Offset(0,0), const Offset(0,0), [
        Colors.red,
        Colors.blue,
      ]), year: year, expenseAmount: exp.amount);
      if(yearlyExpensesData.contains(model)){
        final matched = yearlyExpensesData.where((element) => element == model);
        matched.first.expenseAmount += model.expenseAmount;
      }else{
        yearlyExpensesData.add(model);
      }
    }
    return yearlyExpensesData;

  }

  List<ExpenseModel> todayExpenseQ(){
    final todayDate = DateTime.now().todayDate;

    final queryBuilder = ObjectBoxStore().expenseBox.query(ExpenseModel_.date.contains(todayDate)).build();
    final todayExpenses = queryBuilder.find();
    queryBuilder.close();
    return todayExpenses;

  }




}