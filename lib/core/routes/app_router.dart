import 'package:go_router/go_router.dart';
import 'package:kontar/core/routes/app_paths.dart';
import 'package:kontar/presentation/pages/budgets/budgets_page.dart';
import 'package:kontar/presentation/pages/categories/categories_page.dart';
import 'package:kontar/presentation/pages/form-category/form_category_page.dart';
import 'package:kontar/presentation/pages/form-expense/form_expense_page.dart';
import 'package:kontar/presentation/pages/home/home_page.dart';
import 'package:kontar/presentation/pages/login/login_page.dart';
import 'package:kontar/presentation/pages/splash/splash_page.dart';

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
      path: AppPaths.budgets,
      builder: (_, __) => BudgetsPage(),
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
