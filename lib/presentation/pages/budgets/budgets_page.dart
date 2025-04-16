import 'package:flutter/material.dart';
import 'package:kontar/presentation/components/card_category.dart';
import 'package:kontar/presentation/pages/budgets/budgets_provider.dart';
import 'package:kontar/presentation/widgets/widgets.dart';
import 'package:provider/provider.dart';

class BudgetsPage extends StatefulWidget {
  const BudgetsPage({super.key});

  @override
  State<BudgetsPage> createState() => _BudgetsPageState();
}

class _BudgetsPageState extends State<BudgetsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BudgetsProvider>(
        context,
        listen: false,
      ).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BudgetsProvider>(context);
    return AppScaffold(
      appBar: AppBar(
        title: const Text('Presupuestos'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: provider.listBudgets.map((budget) {
            return CardExpense(
              name: budget.name,
              gastoActual: budget.total,
              presupuestoMaximo: budget.maxAmount,
              color: budget.color,
            );
          }).toList(),
        ),
      ),
    );
  }
}
