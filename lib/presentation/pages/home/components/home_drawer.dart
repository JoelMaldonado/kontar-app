import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kontrol_app/core/routes/app_paths.dart';
import 'package:kontrol_app/presentation/widgets/app_button.dart';

enum MenuOptions {
  categories,
  budgets,
}

class HomeDrawer extends StatefulWidget {
  final VoidCallback logout;

  const HomeDrawer({
    super.key,
    required this.logout,
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
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Cerrar sesión'),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: Text('Cerrar sesión'),
                    content: Text('¿Está seguro de que desea cerrar sesión?'),
                    actions: [
                      Row(
                        spacing: 16,
                        children: [
                          Expanded(
                            child: AppButton(
                              text: "Cancelar",
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ),
                          Expanded(
                            child: AppButton(
                              text: "Si",
                              onPressed: () {
                                Navigator.of(context).pop();
                                widget.logout();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
          )
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
