import 'package:dartz/dartz.dart';
import 'package:kontrol_app/core/errors/failure.dart';
import 'package:kontrol_app/data/service/expense_service.dart';
import 'package:kontrol_app/domain/model/budget.dart';
import 'package:kontrol_app/domain/model/expense_category.dart';
import 'package:kontrol_app/domain/repository/expense_repository.dart';

class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseService _service;

  ExpenseRepositoryImpl(this._service);

  @override
  Future<Either<Failure, List<Budget>>> allBudgets() async {
    try {
      final res = await _service.allBudgets();
      if (res.statusCode == 200) {
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
      if (res.statusCode == 200) {
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
      final res = await _service.createCategory(
        name: name,
        idIcon: idIcon,
        idColor: idColor,
      );
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
