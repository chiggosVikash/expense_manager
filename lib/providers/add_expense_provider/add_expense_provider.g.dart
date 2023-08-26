// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_expense_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addExpensePHash() => r'8a086aa3d855eea977ab1d5594d49b41e6e031fa';

/// A provider for managing the state and logic related to adding expenses.
///
/// This class extends [StateNotifier] from the `flutter_riverpod` package and incorporates the
/// [LDBQuery] mixin for handling database queries. It provides a method `saveExpense` to
/// save a new expense entry, updating the state with the result.
///
///
/// Copied from [AddExpenseP].
@ProviderFor(AddExpenseP)
final addExpensePProvider =
    AutoDisposeAsyncNotifierProvider<AddExpenseP, int>.internal(
  AddExpenseP.new,
  name: r'addExpensePProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$addExpensePHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddExpenseP = AutoDisposeAsyncNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
