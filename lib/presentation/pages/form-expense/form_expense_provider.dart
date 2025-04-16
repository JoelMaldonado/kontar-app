import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kontrol_app/domain/model/expense_category.dart';
import 'package:kontrol_app/domain/repository/expense_repository.dart';

class FormExpenseProvider extends ChangeNotifier {
  final ExpenseRepository _repo;

  FormExpenseProvider(this._repo);

  List<ExpenseCategory> listCategories = [];

  final amountController = TextEditingController();
  final descriptionController = TextEditingController();
  ExpenseCategory? selectedCategory;

  init() async {
    await _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    final result = await _repo.fetchCategories();
    result.fold(
      (l) => Fluttertoast.showToast(msg: l.message),
      (r) {
        listCategories = List.of(r);
        notifyListeners();
      },
    );
  }

  setCategory(ExpenseCategory category) {
    selectedCategory = category;
    notifyListeners();
  }
}
