
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

/// A manager class that handles the data management and calculations for the dashboard.
///
/// This class extends the generated base class _$DashboardManager, implementing various
/// interfaces such as DashboardQuery and LDBQuery. It provides methods for initializing
/// dashboard values, refreshing the dashboard, and calculating different types of expenses.

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


  /// Initializes the dashboard model with various calculated values.
  ///
  /// This method initializes a [DashboardModel] by calling different methods
  /// to calculate and retrieve values needed for the dashboard. It gathers
  /// information about the last added expense, monthly expenses, today's expenses,
  /// yearly expenses, and more. The initialized [DashboardModel] encapsulates all
  /// these values for display on the dashboard.
  ///
  /// Returns a fully initialized [DashboardModel].
  DashboardModel _valueInitializer() {
    /// Calculate current month's expense amount
    final currentMonthExpense = currentMonthExpenseAmount();

    /// Get details of the last added expense
    final lastAddedExpenseData = lastAddedExpense();

    /// Calculate monthly expenses for each month
    final monthlyWiseExpenses = monthWiseExpense();

    /// Calculate total expense amount for today
    final todayExpense = todayExpenseAmount();

    /// Calculate yearly expenses data
    final yearlyExpense = yearlyExpenses();

    /// Get category-wise expenses for today
    final todayExpenseCato = todayExpenseCategory();

    /// Get the top three expense categories
    final top3Category = top3ExpenseCategory();

    /// Create and return the DashboardModel
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


  /// Builds and returns the initial state of the dashboard model.
  ///
  /// This method is an override of the `build` method defined in the
  /// base class. It initializes and returns the initial state of the dashboard
  /// by calling the [_valueInitializer] method. The method calculates and retrieves
  /// various data points to construct a complete [DashboardModel].
  ///
  /// Returns a [DashboardModel] representing the initial state of the dashboard.
  @override
  FutureOr<DashboardModel> build() {
    // ObjectBoxStore().settingBox.removeAll();
    return _valueInitializer();
  }


  /// Refreshes the dashboard page by updating the state with new data.
  ///
  /// This asynchronous method updates the state of the dashboard by setting it to a
  /// new `AsyncValue.data` containing the result of calling the [_valueInitializer]
  /// method. By doing so, the dashboard data is refreshed with the most up-to-date
  /// values available. This method is intended to be called when the user requests
  /// to refresh the dashboard page.
  ///
  /// Returns a [Future] that completes when the dashboard state is successfully updated.
  Future<void> refreshPage() async {
    state = AsyncValue.data(_valueInitializer());
  }


  /// Calculates the total expense amount for the current month.
  ///
  /// This method calculates and returns the total expense amount for the current month.
  /// It uses the [DateTime.now().dateMonth] property to determine the current month.
  /// It then queries the monthly expenses using the [monthWiseExpense] method and
  /// filters the expenses to match the current month. If expenses are found for the
  /// current month, the total amount is calculated and returned. Otherwise, 0.0 is
  /// returned indicating that no expenses are available for the current month.
  ///
  /// Returns the total expense amount for the current month.
  @override
  double currentMonthExpenseAmount() {
    final currentMonth = DateTime.now().dateMonth;
    final monthlyExpenses = monthWiseExpense();
    final matchedMonthData = monthlyExpenses.where((element) => element.month == currentMonth);

    if (matchedMonthData.isNotEmpty) {
      return matchedMonthData.first.amount;
    }

    return 0.0;
  }


  /// Retrieves the details of the last added expense.
  ///
  /// This method retrieves the details of the last added expense from the list of all expenses.
  /// It first fetches all expenses using the [getExpenses] method. If the list of expenses is empty,
  /// it returns `null`, indicating that no expenses are available. Otherwise, it returns the first
  /// element of the list, which represents the last added expense.
  ///
  /// Returns the details of the last added expense, or `null` if no expenses are available.
  @override
  ExpenseModel? lastAddedExpense() {
    final expenses = getExpenses();

    if (expenses.isEmpty) {
      return null;
    }

    return expenses[0];
  }


  /// Generates a list of monthly expenses grouped by month.
  ///
  /// This method generates a list of [MonthlyExpenseModel] instances representing
  /// the total expenses for each month. It first fetches the current year's expenses
  /// using the [currentYearExpensesQ] method. For each expense in the list, it extracts
  /// the month and amount, and then checks if an entry for that month already exists
  /// in the [monthlyExpensesData] list. If an entry exists, it increments the existing
  /// amount. Otherwise, it adds a new entry for the month to the list. The resulting
  /// list contains cumulative monthly expense data for the current year.
  ///
  /// Returns a list of [MonthlyExpenseModel] instances representing monthly expenses.
  @override
  List<MonthlyExpenseModel> monthWiseExpense() {
    var monthlyExpensesData = <MonthlyExpenseModel>[];
    final currentYearExpenses = currentYearExpensesQ();

    for (var exp in currentYearExpenses) {
      final month = exp.date.month;
      final monthData = MonthlyExpenseModel(amount: exp.amount, month: month);
      final matchedData = monthlyExpensesData.where((element) => element == monthData);

      if (matchedData.isNotEmpty) {
        matchedData.first.amount += monthData.amount;
      } else {
        monthlyExpensesData.add(monthData);
      }
    }

    return monthlyExpensesData;
  }


  /// Calculates the total expense amount for today.
  ///
  /// This method calculates the total expense amount for the current day. It fetches
  /// today's expenses using the [todayExpenseQ] method. It then uses the `fold` function
  /// to iterate through the list of expenses and accumulate the amounts. The resulting
  /// total amount is returned, representing the total expenses for the current day.
  ///
  /// Returns the total expense amount for the current day.
  @override
  double todayExpenseAmount() {
    final todayExpenses = todayExpenseQ();
    final amount = todayExpenses.fold(0.0, (previousValue, element) => previousValue + element.amount);
    return amount;
  }


  /// Generates a list of category-wise expenses for today.
  ///
  /// This method generates a list of [CategoryWiseExpenseModel] instances representing
  /// the expenses categorized by their respective categories for the current day. It first
  /// fetches today's expenses using the [todayExpenseQ] method. For each expense in the list,
  /// it creates a [CategoryWiseExpenseModel] instance containing the category and amount.
  /// It then checks if an entry for that category already exists in the [todayExpensesData] list.
  /// If an entry exists, it updates the existing amount. Otherwise, it adds a new entry for the
  /// category to the list. The resulting list contains category-wise expense data for the current day.
  ///
  /// Returns a list of [CategoryWiseExpenseModel] instances representing category-wise expenses for today.
  @override
  List<CategoryWiseExpenseModel> todayExpenseCategory() {
    List<CategoryWiseExpenseModel> todayExpensesData = [];
    final todayExpenses = todayExpenseQ();

    for (var exp in todayExpenses) {
      final categoryData = CategoryWiseExpenseModel(category: exp.category, amount: exp.amount);

      if (todayExpensesData.contains(categoryData)) {
        final matchedCategory = todayExpensesData.where((element) => element == categoryData).toList();
        matchedCategory[0].amount += categoryData.amount;
      } else {
        todayExpensesData.add(categoryData);
      }
    }

    return todayExpensesData;
  }


  /// Generates a list of yearly expenses along with shading gradients.
  ///
  /// This method generates a list of [YearlyExpenseModel] instances representing the
  /// yearly expenses. It first fetches the yearly expenses using the [yearlyExpensesQ]
  /// method. If there are no yearly expenses, an empty list is returned. If there is only
  /// one set of yearly expenses, the shader gradient [_firstYearShed] is applied and the
  /// yearly expenses are returned. If there are more than one set of yearly expenses, the
  /// shader gradients [_firstYearShed] and [_secYearShed] are applied to the first and second
  /// sets respectively, and both sets of yearly expenses are returned as a list.
  ///
  /// Returns a list of [YearlyExpenseModel] instances representing yearly expenses with shading gradients.
  @override
  List<YearlyExpenseModel> yearlyExpenses() {
    final yearlyExpensesData = yearlyExpensesQ();

    if (yearlyExpensesData.isEmpty) {
      return [];
    }

    if (yearlyExpensesData.length < 2) {
      yearlyExpensesData[0].shader = _firstYearShed;
      return yearlyExpensesData;
    }

    final firstYearData = yearlyExpensesData[0];
    firstYearData.shader = _firstYearShed;

    final secYearData = yearlyExpensesData[1];
    secYearData.shader = _secYearShed;

    return [firstYearData, secYearData];
  }


  /// Retrieves the top three expense categories based on their amounts.
  ///
  /// This method retrieves the top three expense categories from the list of
  /// [CategoryWiseExpenseModel] instances. It fetches the category-wise expenses
  /// using the [categoryExpensesQ] method and then sorts them in descending order
  /// based on their amounts. If there are three or fewer expense categories,
  /// the method returns the entire list. If there are more than three categories,
  /// it returns a list containing the top three categories with the highest expenses.
  ///
  /// Returns a list of [CategoryWiseExpenseModel] instances representing the top three expense categories.
  @override
  List<CategoryWiseExpenseModel> top3ExpenseCategory() {
    final categoriesExpenses = categoryExpensesQ();

    categoriesExpenses.sort((a, b) => b.amount.compareTo(a.amount));

    if (categoriesExpenses.length <= 3) {
      return categoriesExpenses;
    }

    return [categoriesExpenses[0], categoriesExpenses[1], categoriesExpenses[2]];
  }



}