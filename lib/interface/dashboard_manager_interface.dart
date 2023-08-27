import '../models/dashboard_models/category_wise_expense_model.dart';
import '../models/dashboard_models/monthly_expense_model.dart';
import '../models/dashboard_models/yearly_expense_model.dart';
import '../models/expense_model.dart';

/// An abstract class defining the interface for managing dashboard-related data.
///
/// This abstract class serves as an interface for classes responsible for managing
/// dashboard-related data, such as expenses categorized by month, year, and category.
/// It outlines the methods that any implementing class should provide to retrieve
/// different types of expense-related information for presentation in the dashboard.
abstract class DashboardManagerInterface {

  /// Retrieves a list of the top three expense categories.
  ///
  /// This method retrieves a list of [CategoryWiseExpenseModel] instances representing
  /// the top three expense categories based on their amounts. The list contains the
  /// categories and their respective expense amounts in descending order.
  List<CategoryWiseExpenseModel> top3ExpenseCategory();

  /// Retrieves a list of category-wise expenses for the current day.
  ///
  /// This method retrieves a list of [CategoryWiseExpenseModel] instances representing
  /// the expenses categorized by their respective categories for the current day.
  List<CategoryWiseExpenseModel> todayExpenseCategory();

  /// Retrieves a list of monthly expenses categorized by month.
  ///
  /// This method retrieves a list of [MonthlyExpenseModel] instances representing
  /// the monthly expenses categorized by their respective months. It provides a summary
  /// of the expenses spent in each month.
  List<MonthlyExpenseModel> monthWiseExpense();

  /// Retrieves the total expense amount for the current month.
  ///
  /// This method calculates and returns the total expense amount spent in the current month.
  double currentMonthExpenseAmount();

  /// Retrieves the total expense amount for the current day.
  ///
  /// This method calculates and returns the total expense amount spent in the current day.
  double todayExpenseAmount();

  /// Retrieves the details of the last added expense.
  ///
  /// This method retrieves the details of the last added expense, returning an instance of
  /// [ExpenseModel] if any expenses are available. If no expenses exist, it returns `null`.
  ExpenseModel? lastAddedExpense();

  /// Retrieves a list of yearly expenses along with shading information.
  ///
  /// This method retrieves a list of [YearlyExpenseModel] instances representing the yearly
  /// expenses categorized by year. It may include shading information for visual distinction.
  List<YearlyExpenseModel> yearlyExpenses();

}
