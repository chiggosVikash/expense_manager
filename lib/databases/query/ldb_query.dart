
import 'dart:core';

import 'package:expense_manager/models/expense_model.dart';

import '../../objectbox.g.dart';
import '../setup/objectbox_storage.dart';

mixin class LDBQuery{

  bool addNewExpense({required ExpenseModel expense}){
    try{
       ObjectBoxStore().expenseBox.put(expense);
       return true;
    }catch(e){
      return false;
    }


  }

  bool updateExpenseQuery({required ExpenseModel expense}){
    final queryBuilder = ObjectBoxStore().expenseBox.query(
      ExpenseModel_.date.equals(expense.date)
    ).build();
    final filteredExpenses = queryBuilder.find();
    queryBuilder.close();
    if(filteredExpenses.isNotEmpty){
      ObjectBoxStore().expenseBox.remove(filteredExpenses[0].id);
      ObjectBoxStore().expenseBox.put(expense);
      return true;
    }else{
      return false;
    }

  }

  List<ExpenseModel> getExpenses(){
    final queryBuilder = ObjectBoxStore().expenseBox.query(

    ).build();
   final expenses = queryBuilder.find();
   queryBuilder.close();
   expenses.sort((a,b)=>b.date.compareTo(a.date));
   return expenses;
  }

  bool deleteExpense({required String expenseId}){
    final queryBuilder = ObjectBoxStore().expenseBox.query(ExpenseModel_.modelId.equals(expenseId)).build();
    final matchedExpense = queryBuilder.find();
    if(matchedExpense.isNotEmpty){
      final id = matchedExpense[0].id;
      queryBuilder.close();
      return ObjectBoxStore().expenseBox.remove(id);
    }
    return false;

  }







}