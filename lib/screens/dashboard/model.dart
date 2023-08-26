import 'dart:ui';

class MonthlyExpenseModel {
  final String month;
  final double expenseAmount;

  MonthlyExpenseModel({required this.month,required this.expenseAmount});
}

class YearlyExpenseModel {
  final String year;
  final double expenseAmount;
  final Shader  shader;

  YearlyExpenseModel({required this.shader,required this.year,required this.expenseAmount,});
}