import 'package:kontrol_app/core/di/di.dart';
import 'package:kontrol_app/core/storage/token_storage.dart';
import 'package:kontrol_app/data/repository/auth_repository_impl.dart';
import 'package:kontrol_app/data/repository/common_repository_impl.dart';
import 'package:kontrol_app/data/repository/expense_repository_impl.dart';
import 'package:kontrol_app/data/service/auth_service.dart';
import 'package:kontrol_app/data/service/common_service.dart';
import 'package:kontrol_app/data/service/expense_service.dart';
import 'package:kontrol_app/domain/repository/auth_repository.dart';
import 'package:kontrol_app/domain/repository/common_repository.dart';
import 'package:kontrol_app/domain/repository/expense_repository.dart';

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
