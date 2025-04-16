import 'package:kontrol_app/core/di/di.dart';
import 'package:kontrol_app/core/storage/token_storage.dart';
import 'package:kontrol_app/domain/repository/auth_repository.dart';
import 'package:kontrol_app/domain/repository/common_repository.dart';
import 'package:kontrol_app/domain/repository/expense_repository.dart';
import 'package:kontrol_app/presentation/pages/categories/categories_provider.dart';
import 'package:kontrol_app/presentation/pages/form-category/form_category_provider.dart';
import 'package:kontrol_app/presentation/pages/form-expense/form_expense_provider.dart';
import 'package:kontrol_app/presentation/pages/home/home_provider.dart';
import 'package:kontrol_app/presentation/pages/login/login_provider.dart';
import 'package:kontrol_app/presentation/pages/splash/splash_provider.dart';

void diProviders() {
  getIt.registerFactory(
    () => LoginProvider(
      getIt<AuthRepository>(),
    ),
  );

  getIt.registerFactory(
    () => SplashProvider(
      getIt<TokenStorage>(),
    ),
  );

  getIt.registerFactory(
    () => HomeProvider(
      getIt<ExpenseRepository>(),
      getIt<TokenStorage>(),
    ),
  );

  getIt.registerFactory(
    () => CategoriesProvider(
      getIt<ExpenseRepository>(),
    ),
  );
  getIt.registerFactory(
    () => FormCategoryProvider(
      getIt<CommonRepository>(),
      getIt<ExpenseRepository>(),
    ),
  );
  getIt.registerFactory(
    () => FormExpenseProvider(
      getIt<ExpenseRepository>(),
    ),
  );
}
