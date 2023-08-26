
import 'package:expense_manager/models/expense_model.dart';

/// The `ExpenseManagerInterface` abstract class defines the contract for managing expenses.
/// Any class implementing this interface must provide implementations for the defined methods.
abstract class ExpenseManagerInterface {



  /// Adds a new expense with the specified details.
  ///
  /// The addExpense method allows for the addition of a new expense to the system with the specified details.
  /// This method serves as a way to input expense information into the system for tracking and analysis.
  ///
  /// - `category`: A required parameter representing the category of the expense.
  /// - `subCategory`: A required parameter representing the sub-category of the expense.
  /// - `date`: A required parameter representing the date of the expense in the format "YYYY-MM-DD".
  /// - `amount`: A required parameter representing the amount of the expense.
  /// - `expenseBy`: A required parameter representing the entity or person associated with the expense.
  /// - `note`: A required parameter representing some description of expense
  void addExpense({
    required String category,
    required String subCategory,
    required String date,
    required String amount,
    required String expenseBy,
    required String note
  });



  /// Retrieves a list of `ExpenseModel` objects representing expenses.
  ///
  /// Returns a list of `ExpenseModel` instances.
  List<ExpenseModel> getExpense();

  /// Deletes an expense based on its unique `expenseId`.
  ///
  /// - `expenseId`: A required unique identifier for the expense to be deleted.
  void deleteExpenses({required String expenseId});

  /// Updates an existing expense with new data.
  ///
  /// - `newModel`: A required `ExpenseModel` instance containing the updated data.
  void updateExpense({required ExpenseModel newModel});
}
