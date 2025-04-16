import 'package:kontar/core/di/di.dart';
import 'package:kontar/core/storage/token_storage.dart';
import 'package:kontar/data/repository/auth_repository_impl.dart';
import 'package:kontar/data/repository/common_repository_impl.dart';
import 'package:kontar/data/repository/expense_repository_impl.dart';
import 'package:kontar/data/service/auth_service.dart';
import 'package:kontar/data/service/common_service.dart';
import 'package:kontar/data/service/expense_service.dart';
import 'package:kontar/domain/repository/auth_repository.dart';
import 'package:kontar/domain/repository/common_repository.dart';
import 'package:kontar/domain/repository/expense_repository.dart';

void diRepositories() {
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      getIt<AuthService>(),
      getIt<TokenStorage>(),
    ),
  );

  getIt.registerLazySingleton<CommonRepository>(
    () => CommonRepositoryImpl(
      getIt<CommonService>(),
    ),
  );

  getIt.registerLazySingleton<ExpenseRepository>(
    () => ExpenseRepositoryImpl(
      getIt<ExpenseService>(),
    ),
  );
}
