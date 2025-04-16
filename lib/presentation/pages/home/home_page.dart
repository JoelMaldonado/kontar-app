import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kontar/core/routes/app_paths.dart';
import 'package:kontar/presentation/pages/home/components/home_drawer.dart';
import 'package:kontar/presentation/pages/home/home_provider.dart';
import 'package:kontar/presentation/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(
        context,
        listen: false,
      ).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    provider.onLogout = () {
      GoRouter.of(context).go(AppPaths.login);
    };
    return AppScaffold(
      appBar: AppBar(
        title: const Text("Mis Gastos"),
      ),
      drawer: HomeDrawer(
        logout: provider.logout,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).push(
            AppPaths.formExpense,
          );
        },
        child: const Icon(Icons.add),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: provider.listExpenses
              .map(
                (e) => Text(
                  e.amount.toString(),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
