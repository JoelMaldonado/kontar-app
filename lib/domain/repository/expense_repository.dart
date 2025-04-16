import 'package:dartz/dartz.dart';
import 'package:kontar/core/errors/failure.dart';
import 'package:kontar/domain/model/budget.dart';
import 'package:kontar/domain/model/expense.dart';
import 'package:kontar/domain/model/expense_category.dart';

abstract class ExpenseRepository {
  Future<Either<Failure, List<Expense>>> fetchExpenses();
  Future<Either<Failure, List<Budget>>> fetchBudgets();
  Future<Either<Failure, List<ExpenseCategory>>> fetchCategories();

  Future<Either<Failure, Unit>> createCategory({
    required String name,
    required int idIcon,
    required int idColor,
  });

  Future<Either<Failure, Unit>> deleteCategory(int id);
}
