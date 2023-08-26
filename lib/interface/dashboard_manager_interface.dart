
import 'package:expense_manager/models/expense_model.dart';

import '../models/dashboard_models/category_wise_expense_model.dart';
import '../models/dashboard_models/monthly_expense_model.dart';
import '../models/dashboard_models/yearly_expense_model.dart';

abstract class DashboardManagerInterface{

  List<CategoryWiseExpenseModel> top3ExpenseCategory();

  List<CategoryWiseExpenseModel> todayExpenseCategory();

  List<MonthlyExpenseModel> monthWiseExpense();

  double currentMonthExpenseAmount();

  double todayExpenseAmount();

  ExpenseModel? lastAddedExpense();

  List<YearlyExpenseModel> yearlyExpenses();

}