import 'package:kontrol_app/core/di/di.dart';
import 'package:kontrol_app/core/network/dio_client.dart';
import 'package:kontrol_app/data/service/auth_service.dart';
import 'package:kontrol_app/data/service/common_service.dart';
import 'package:kontrol_app/data/service/expense_service.dart';

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
