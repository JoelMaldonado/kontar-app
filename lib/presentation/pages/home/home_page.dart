import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kontrol_app/core/routes/app_paths.dart';
import 'package:kontrol_app/presentation/components/card_category.dart';
import 'package:kontrol_app/presentation/pages/home/components/home_drawer.dart';
import 'package:kontrol_app/presentation/pages/home/home_provider.dart';
import 'package:kontrol_app/presentation/widgets/widgets.dart';
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
    return AppScaffold(
      appBar: AppBar(
        title: const Text("Mis Gastos"),
      ),
      drawer: HomeDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).push(
            AppPaths.formExpense,
          );
        },
        child: const Icon(Icons.add),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: provider.listBudgets.map((budget) {
          return CardExpense(
            name: budget.name,
            gastoActual: budget.total,
            presupuestoMaximo: budget.maxAmount,
            color: budget.color,
          );
        }).toList(),
      ),
    );
  }
}
