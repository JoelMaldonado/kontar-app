import 'package:go_router/go_router.dart';
import 'package:kontrol_app/core/routes/app_paths.dart';
import 'package:kontrol_app/presentation/pages/categories/categories_page.dart';
import 'package:kontrol_app/presentation/pages/form-category/form_category_page.dart';
import 'package:kontrol_app/presentation/pages/form-expense/form_expense_page.dart';
import 'package:kontrol_app/presentation/pages/home/home_page.dart';
import 'package:kontrol_app/presentation/pages/login/login_page.dart';
import 'package:kontrol_app/presentation/pages/splash/splash_page.dart';

final appRouter = GoRouter(
  initialLocation: AppPaths.splash,
  routes: [
    GoRoute(
      path: AppPaths.splash,
      builder: (_, __) => const SplashPage(),
    ),
    GoRoute(
      path: AppPaths.login,
      builder: (_, __) => const LoginPage(),
    ),
    GoRoute(
      path: AppPaths.menu,
      builder: (_, __) => HomePage(),
    ),
    GoRoute(
      path: AppPaths.categories,
      builder: (_, __) => CategoriesPage(),
    ),
    GoRoute(
      path: AppPaths.formCategory,
      builder: (_, __) => const FormCategoryPage(),
    ),
    GoRoute(
      path: AppPaths.formExpense,
      builder: (_, __) => const FormExpensePage(),
    ),
  ],
);
