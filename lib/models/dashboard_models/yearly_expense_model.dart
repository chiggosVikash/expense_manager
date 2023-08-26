import 'dart:ui';

class YearlyExpenseModel {
  final String year;
  double expenseAmount;
  Shader  shader;

  YearlyExpenseModel({required this.shader,required this.year,required this.expenseAmount,});

  @override
  bool operator ==(covariant YearlyExpenseModel other) {
    return year == other.year;
  }

  @override
  int get hashCode => year.hashCode;
}