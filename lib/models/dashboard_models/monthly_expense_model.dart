
import 'package:flutter/foundation.dart';

class MonthlyExpenseModel{
  String month;
  double amount;

  MonthlyExpenseModel({required this.amount,required this.month});

  @override
  bool operator ==(covariant MonthlyExpenseModel other) {
    return month == other.month;
  }

  @override
  int get hashCode => month.hashCode;
}