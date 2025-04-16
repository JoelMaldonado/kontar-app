import 'package:flutter/material.dart';
import 'package:kontar/core/storage/token_storage.dart';
import 'package:kontar/domain/model/expense.dart';
import 'package:kontar/domain/repository/expense_repository.dart';

class HomeProvider extends ChangeNotifier {
  final ExpenseRepository _expenseRepository;
  final TokenStorage _tokenStorage;

  HomeProvider(
    this._expenseRepository,
    this._tokenStorage,
  );

  Function? onLogout;

  init() async {
    await getExpenses();
  }

  List<Expense> listExpenses = [];

  Future<void> getExpenses() async {
    final res = await _expenseRepository.fetchExpenses();
    res.fold(
      (l) => debugPrint(l.message),
      (r) {
        listExpenses = List.of(r);
        print(listExpenses);
        notifyListeners();
      },
    );
  }

  logout() async {
    await _tokenStorage.clearAccessToken();
    await _tokenStorage.clearRefreshToken();
    onLogout?.call();
  }
}
