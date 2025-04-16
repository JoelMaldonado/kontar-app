import 'package:kontar/core/di/di.dart';
import 'package:kontar/core/network/dio_client.dart';
import 'package:kontar/data/service/auth_service.dart';
import 'package:kontar/data/service/common_service.dart';
import 'package:kontar/data/service/expense_service.dart';

void diServices() {
  getIt.registerLazySingleton<AuthService>(
    () => AuthService(
      getIt<DioClient>(),
    ),
  );
  getIt.registerLazySingleton<CommonService>(
    () => CommonService(
      getIt<DioClient>(),
    ),
  );

  getIt.registerLazySingleton<ExpenseService>(
    () => ExpenseService(
      getIt<DioClient>(),
    ),
  );
}
