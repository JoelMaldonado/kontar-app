import 'package:dartz/dartz.dart';
import 'package:kontrol_app/core/errors/failure.dart';
import 'package:kontrol_app/domain/model/budget.dart';
import 'package:kontrol_app/domain/model/expense_category.dart';

abstract class ExpenseRepository {
  Future<Either<Failure, List<Budget>>> allBudgets();
  Future<Either<Failure, List<ExpenseCategory>>> fetchCategories();

  Future<Either<Failure, Unit>> createCategory({
    required String name,
    required int idIcon,
    required int idColor,
  });

  Future<Either<Failure, Unit>> deleteCategory(int id);
}
