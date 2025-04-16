import 'package:flutter/material.dart';
import 'package:kontar/domain/model/expense_category.dart';
import 'package:kontar/domain/repository/expense_repository.dart';

class CategoriesProvider extends ChangeNotifier {
  final ExpenseRepository _repo;

  CategoriesProvider(this._repo);

  List<ExpenseCategory> listCategories = [];

  init() async {
    await _fetchCategories();
  }

  _fetchCategories() async {
    final res = await _repo.fetchCategories();
    res.fold(
      (l) => null,
      (r) {
        listCategories = List.of(r);
        notifyListeners();
      },
    );
  }

  Future<void> deleteCategory(int id) async {
    final res = await _repo.deleteCategory(id);
    res.fold(
      (l) => null,
      (r) {
        listCategories.removeWhere((element) => element.id == id);
        notifyListeners();
      },
    );
  }
}
