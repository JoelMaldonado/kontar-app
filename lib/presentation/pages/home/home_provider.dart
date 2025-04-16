import 'package:flutter/material.dart';
import 'package:kontrol_app/core/storage/token_storage.dart';
import 'package:kontrol_app/domain/model/budget.dart';
import 'package:kontrol_app/domain/repository/expense_repository.dart';

class HomeProvider extends ChangeNotifier {
  final ExpenseRepository _expenseRepository;
  final TokenStorage _tokenStorage;

  HomeProvider(
    this._expenseRepository,
    this._tokenStorage,
  );

  List<Budget> listBudgets = [];

  init() async {
    await getBudgets();
  }

  Function? onLogout;

  logout() async {
    await _tokenStorage.clearAccessToken();
    await _tokenStorage.clearRefreshToken();
    onLogout?.call();
  }

  getBudgets() async {
    final res = await _expenseRepository.allBudgets();
    res.fold(
      (l) => debugPrint(l.message),
      (r) {
        listBudgets = List.of(r);
        notifyListeners();
      },
    );
  }
}
