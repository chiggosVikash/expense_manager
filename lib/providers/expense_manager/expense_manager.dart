
import 'package:expense_manager/databases/query/ldb_query.dart';
import 'package:expense_manager/interface/expense_manager_interface.dart';
import 'package:expense_manager/models/expense_model.dart';
import 'package:expense_manager/providers/add_expense_provider/add_expense_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'expense_manager.g.dart';
@Riverpod(keepAlive: false)
class ExpenseManager extends _$ExpenseManager with LDBQuery implements ExpenseManagerInterface{

  @override
  List<ExpenseModel> build(){
    return getExpenses();
  }

  @override
  void deleteExpenses({required String expenseId}) {
    final status = deleteExpense(expenseId: expenseId);
    if(status){
      state = getExpenses();
    }
  }

  @override
  List<ExpenseModel> getExpense() {
    final fetchedExpenses = getExpenses();
    state = fetchedExpenses;
    return fetchedExpenses;
  }

  @override
  void updateExpense({required ExpenseModel newModel}) {
    updateExpense(newModel: newModel);
    state = getExpenses();
  }

  @override
  void addExpense({required String category,required String subCategory,required String date,
  required String amount,required String expenseBy,required String note}
  ) {
    ref.read(addExpensePProvider.notifier).saveExpense(category: category,
        subCategory: subCategory,
        date: date,
        amount: amount,
        expenseBy: expenseBy,
      note: note
    );
  }
}