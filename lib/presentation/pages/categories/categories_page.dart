import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kontar/core/routes/app_paths.dart';
import 'package:kontar/presentation/pages/categories/categories_provider.dart';
import 'package:kontar/presentation/pages/categories/components/card_category.dart';
import 'package:kontar/presentation/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CategoriesProvider>(
        context,
        listen: false,
      ).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CategoriesProvider>(context);
    return AppScaffold(
      appBar: AppBar(
        title: const Text("Categorías"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final res = await GoRouter.of(context).push(AppPaths.formCategory);
          if (res != null) {
            provider.init();
          }
        },
        child: Icon(Icons.add),
      ),
      child: GridView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: provider.listCategories.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1,
        ),
        itemBuilder: (c, i) {
          final category = provider.listCategories[i];
          return CardCategory(
            name: category.name,
            color: category.color,
            icon: category.icon,
            onEdit: () {},
            onDelete: () => provider.deleteCategory(category.id),
          );
        },
      ),
    );
  }
}
