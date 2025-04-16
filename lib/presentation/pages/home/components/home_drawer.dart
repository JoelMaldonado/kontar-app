import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kontrol_app/core/routes/app_paths.dart';

enum MenuOptions {
  categories,
  budgets,
}

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Kontrol',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          Column(
            children: MenuOptions.values
                .map(
                  (e) => ListTile(
                    leading: Icon(_getIcon(e)),
                    title: Text(_getTitle(e)),
                    onTap: () => _onOptionSelected(e),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  IconData _getIcon(MenuOptions option) {
    switch (option) {
      case MenuOptions.categories:
        return Icons.category;
      case MenuOptions.budgets:
        return Icons.monetization_on;
    }
  }

  String _getTitle(MenuOptions option) {
    switch (option) {
      case MenuOptions.categories:
        return 'Categorías';
      case MenuOptions.budgets:
        return 'Presupuestos';
    }
  }

  void _onOptionSelected(MenuOptions option) {
    final go = GoRouter.of(context);
    switch (option) {
      case MenuOptions.categories:
        go.push(AppPaths.categories);
        break;
      case MenuOptions.budgets:
        break;
    }
  }
}
