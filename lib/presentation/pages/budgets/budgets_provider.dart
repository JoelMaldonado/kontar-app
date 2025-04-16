import 'package:flutter/material.dart';
import 'package:kontar/domain/model/budget.dart';
import 'package:kontar/domain/repository/expense_repository.dart';

class BudgetsProvider extends ChangeNotifier {
  final ExpenseRepository _expenseRepository;

  BudgetsProvider(this._expenseRepository);

  List<Budget> listBudgets = [];

  init() async {
    await getBudgets();
  }

  getBudgets() async {
    final res = await _expenseRepository.fetchBudgets();
    res.fold(
      (l) => debugPrint(l.message),
      (r) {
        listBudgets = List.of(r);
        notifyListeners();
      },
    );
  }
}
