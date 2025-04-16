import 'package:dartz/dartz.dart';
import 'package:kontar/core/errors/failure.dart';
import 'package:kontar/data/model/request/category_request.dart';
import 'package:kontar/data/service/expense_service.dart';
import 'package:kontar/domain/model/budget.dart';
import 'package:kontar/domain/model/expense.dart';
import 'package:kontar/domain/model/expense_category.dart';
import 'package:kontar/domain/repository/expense_repository.dart';

class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseService _service;

  ExpenseRepositoryImpl(this._service);

  @override
  Future<Either<Failure, List<Expense>>> fetchExpenses() async {
    try {
      final res = await _service.fetchExpenses();
      if (res.isSuccess()) {
        return Right(res.data?.map((e) => e.toDomain()).toList() ?? []);
      } else {
        return Left(Failure(res.message));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Budget>>> fetchBudgets() async {
    try {
      final res = await _service.fetchBudgets();
      if (res.isSuccess()) {
        return Right(res.data?.map((e) => e.toDomain()).toList() ?? []);
      } else {
        return Left(Failure(res.message));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ExpenseCategory>>> fetchCategories() async {
    try {
      final res = await _service.fetchCategories();
      if (res.isSuccess()) {
        return Right(res.data?.map((e) => e.toDomain()).toList() ?? []);
      } else {
        return Left(Failure(res.message));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> createCategory({
    required String name,
    required int idIcon,
    required int idColor,
  }) async {
    try {
      final request = CreateCategoryRequest(
        name: name,
        idIcon: idIcon,
        idColor: idColor,
      );
      final res = await _service.createCategory(request);
      if (res.isSuccess()) {
        return Right(unit);
      } else {
        return Left(Failure(res.message));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteCategory(int id) async {
    try {
      final res = await _service.deleteCategory(id);
      if (res.isSuccess()) {
        return Right(unit);
      } else {
        return Left(Failure(res.message));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
