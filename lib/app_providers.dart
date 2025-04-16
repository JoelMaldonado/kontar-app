import 'package:kontrol_app/core/di/di.dart';
import 'package:kontrol_app/presentation/pages/categories/categories_provider.dart';
import 'package:kontrol_app/presentation/pages/form-category/form_category_provider.dart';
import 'package:kontrol_app/presentation/pages/form-expense/form_expense_provider.dart';
import 'package:kontrol_app/presentation/pages/home/home_provider.dart';
import 'package:kontrol_app/presentation/pages/login/login_provider.dart';
import 'package:kontrol_app/presentation/pages/splash/splash_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get appProviders {
  return [
    ChangeNotifierProvider(
      create: (_) => getIt<LoginProvider>(),
    ),
    ChangeNotifierProvider(
      create: (_) => getIt<SplashProvider>(),
    ),
    ChangeNotifierProvider(
      create: (_) => getIt<HomeProvider>(),
    ),
    ChangeNotifierProvider(
      create: (_) => getIt<CategoriesProvider>(),
    ),
    ChangeNotifierProvider(
      create: (_) => getIt<FormCategoryProvider>(),
    ),
    ChangeNotifierProvider(
      create: (_) => getIt<FormExpenseProvider>(),
    ),
  ];
}
