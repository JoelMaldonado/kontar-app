import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kontar/domain/model/common_color.dart';
import 'package:kontar/domain/model/common_icon.dart';
import 'package:kontar/domain/repository/common_repository.dart';
import 'package:kontar/domain/repository/expense_repository.dart';

class FormCategoryProvider extends ChangeNotifier {
  final CommonRepository _commonRepo;
  final ExpenseRepository _expenseRepo;

  FormCategoryProvider(
    this._commonRepo,
    this._expenseRepo,
  );

  Function? onSuccess;

  List<CommonIcon> icons = [];
  List<CommonColor> colors = [];

  final nameController = TextEditingController();
  CommonIcon? selectedIcon;
  CommonColor? selectedColor;

  bool isLoadingSaveCategory = false;

  init() async {
    await fetchIcons();
    await fetchColors();
    notifyListeners();
  }

  Future<void> fetchIcons() async {
    final res = await _commonRepo.fetchCommonIcons();
    res.fold(
      (l) => Fluttertoast.showToast(msg: l.message),
      (r) => icons = List.of(r),
    );
  }

  Future<void> fetchColors() async {
    final res = await _commonRepo.fetchCommonColors();
    res.fold(
      (l) => Fluttertoast.showToast(msg: l.message),
      (r) => colors = List.of(r),
    );
  }

  Future<void> saveCategory() async {
    if (nameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "El nombre de la categoría es requerido");
      return;
    }
    if (selectedIcon == null) {
      Fluttertoast.showToast(msg: "El icono de la categoría es requerido");
      return;
    }
    if (selectedColor == null) {
      Fluttertoast.showToast(msg: "El color de la categoría es requerido");
      return;
    }
    isLoadingSaveCategory = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    final res = await _expenseRepo.createCategory(
      name: nameController.text,
      idIcon: selectedIcon!.id,
      idColor: selectedColor!.id,
    );
    res.fold(
      (l) {
        Fluttertoast.showToast(msg: l.message);
        isLoadingSaveCategory = false;
        notifyListeners();
      },
      (r) {
        nameController.clear();
        selectedIcon = null;
        selectedColor = null;
        onSuccess?.call();
        isLoadingSaveCategory = false;
        notifyListeners();
      },
    );
  }

  void setIcon(CommonIcon icon) {
    selectedIcon = icon;
    notifyListeners();
  }

  void setColor(CommonColor color) {
    selectedColor = color;
    notifyListeners();
  }
}
