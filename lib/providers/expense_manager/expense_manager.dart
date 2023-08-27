
import 'package:expense_manager/databases/query/ldb_query.dart';
import 'package:expense_manager/interface/expense_manager_interface.dart';
import 'package:expense_manager/models/expense_model.dart';
import 'package:expense_manager/providers/add_expense_provider/add_expense_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'expense_manager.g.dart';

/// A class representing the ExpenseManager, implementing the [ExpenseManagerInterface].
///
/// This class manages expenses by providing methods to retrieve, delete, update,
/// and add expenses. It extends the generated base class [_$ExpenseManager]
/// and includes methods from the [LDBQuery] mixin.
@Riverpod(keepAlive: false)
class ExpenseManager extends _$ExpenseManager with LDBQuery implements ExpenseManagerInterface {

  /// Builds and returns a list of all expenses.
  ///
  /// This method overrides the [build] method defined in the base class and
  /// fetches all expenses using the [getExpenses] method. It returns the list
  /// of expenses, which represents the entire collection of expenses.
  ///
  /// Returns a list of [ExpenseModel] instances representing all expenses.
  @override
  List<ExpenseModel> build() {
    return getExpenses();
  }

  /// Deletes an expense based on its ID and updates the state.
  ///
  /// This method overrides the [deleteExpenses] method from [ExpenseManagerInterface].
  /// It attempts to delete the expense with the provided [expenseId] using the
  /// [deleteExpense] method. If the deletion is successful, it updates the state
  /// by fetching all expenses again.
  ///
  /// Parameter [expenseId]: The ID of the expense to be deleted.
  @override
  void deleteExpenses({required String expenseId}) {
    final status = deleteExpense(expenseId: expenseId);
    if (status) {
      state = getExpenses();
    }
  }

  /// Retrieves and returns a list of expenses, updating the state in the process.
  ///
  /// This method overrides the [getExpense] method from [ExpenseManagerInterface].
  /// It fetches the list of expenses using the [getExpenses] method, updates the state
  /// with the fetched data, and then returns the list of expenses.
  ///
  /// Returns a list of [ExpenseModel] instances representing all expenses.
  @override
  List<ExpenseModel> getExpense() {
    final fetchedExpenses = getExpenses();
    state = fetchedExpenses;
    return fetchedExpenses;
  }

  /// Updates an expense with new data and updates the state.
  ///
  /// This method overrides the [updateExpense] method from [ExpenseManagerInterface].
  /// It updates an existing expense using the [updateExpense] method with the provided
  /// [newModel]. After the update, it fetches all expenses and updates the state.
  ///
  /// Parameter [newModel]: The new [ExpenseModel] containing updated data.
  @override
  void updateExpense({required ExpenseModel newModel}) {
    updateExpense(newModel: newModel);
    state = getExpenses();
  }

  /// Adds a new expense with the provided details.
  ///
  /// This method overrides the [addExpense] method from [ExpenseManagerInterface].
  /// It utilizes the [addExpensePProvider] to save the new expense using the provided
  /// details such as [category], [subCategory], [date], [amount], [expenseBy], and [note].
  ///
  /// Parameters:
  /// - [category]: The category of the expense.
  /// - [subCategory]: The sub-category of the expense.
  /// - [date]: The date of the expense.
  /// - [amount]: The amount of the expense.
  /// - [expenseBy]: The entity responsible for the expense.
  /// - [note]: Additional notes about the expense.
  @override
  void addExpense({
    required String category,
    required String subCategory,
    required String date,
    required String amount,
    required String expenseBy,
    required String note,
  }) {
    ref.read(addExpensePProvider.notifier).saveExpense(
      category: category,
      subCategory: subCategory,
      date: date,
      amount: amount,
      expenseBy: expenseBy,
      note: note,
    );
  }
}
