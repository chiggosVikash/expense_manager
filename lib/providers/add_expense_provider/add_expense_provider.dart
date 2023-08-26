import 'dart:typed_data';

import 'package:expense_manager/databases/query/ldb_query.dart';
import 'package:expense_manager/models/expense_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'add_expense_provider.g.dart';


/// A provider for managing the state and logic related to adding expenses.
///
/// This class extends [StateNotifier] from the `flutter_riverpod` package and incorporates the
/// [LDBQuery] mixin for handling database queries. It provides a method `saveExpense` to
/// save a new expense entry, updating the state with the result.
///
@Riverpod(keepAlive: false)
class AddExpenseP extends _$AddExpenseP with LDBQuery {

  /// Placeholder method for building the state.
  ///
  /// This method is intended to fulfill the required abstract method from the extended class.
  /// It returns a value of 1 as a placeholder.
  @override
  FutureOr<int> build() {
    return 1;
  }

  /// A method for saving expense details.
  ///
  /// This method accepts various parameters like category, subCategory, date, amount, note,
  /// billNo, expenseBy, and an optional image. It creates an [ExpenseModel] instance and
  /// performs the necessary operations to add the expense to the database. Afterward, it updates
  /// the state with the result of the operation (1 for success, 0 for failure).
  Future<void> saveExpense({
    required String category,
    required String subCategory,
    required String date,
    required String amount,
    String? note,
    String? billNo,
    required String expenseBy,
    Uint8List? image,
  }) async {
    /// Convert amount to double
    final price = double.parse(amount);

    /// Create an ExpenseModel instance
    final expense = ExpenseModel(
      category: category.trim().toLowerCase(),
      subCategory: subCategory.trim().toLowerCase(),
      amount: price,
      date: date,
      image: image,
      expenseBy: expenseBy,
      note: note,
      billNo: billNo,
    );

    /// Add the new expense
    final status = addNewExpense(expense: expense);

    /// Update the state with the result
    state = AsyncValue.data(status ? 1 : 0);
  }


}
