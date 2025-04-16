import 'package:flutter/material.dart';
import 'package:kontrol_app/domain/model/budget.dart';
import 'package:kontrol_app/domain/repository/expense_repository.dart';

class HomeProvider extends ChangeNotifier {
  final ExpenseRepository _expenseRepository;
  HomeProvider(this._expenseRepository);

  List<Budget> listBudgets = [];

  init() async {
    try {
      await getBudgets();
    } finally {
      notifyListeners();
    }
  }

  getBudgets() async {
    final res = await _expenseRepository.allBudgets();
    res.fold(
      (l) => debugPrint(l.message),
      (r) => listBudgets = List.of(r),
    );
  }
}
