import 'package:flutter/material.dart';
import 'package:kontar/presentation/pages/form-expense/form_expense_provider.dart';
import 'package:kontar/presentation/widgets/app_button.dart';
import 'package:kontar/presentation/widgets/widgets.dart';
import 'package:provider/provider.dart';

class FormExpensePage extends StatefulWidget {
  const FormExpensePage({super.key});

  @override
  State<FormExpensePage> createState() => _FormExpensePageState();
}

class _FormExpensePageState extends State<FormExpensePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<FormExpenseProvider>(
        context,
        listen: false,
      ).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FormExpenseProvider>(context);
    return AppScaffold(
      appBar: AppBar(
        title: const Text("Agregar Gasto"),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 24,
            children: [
              AppTextField(
                label: "Monto",
                hint: "S/ 0.00",
                controller: provider.amountController,
                textInputType: TextInputType.number,
              ),
              AppTextField(
                label: "Descripción",
                hint: "Opcional",
                controller: provider.descriptionController,
              ),
              //_sectionPhoto(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 6,
                children: [
                  const Text(
                    'Selecciona una categoría',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: provider.listCategories.map((categoria) {
                      final isSelected = provider.selectedCategory == categoria;
                      return GestureDetector(
                        onTap: () => provider.setCategory(categoria),
                        child: Container(
                          width: 90,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? categoria.color.withValues(alpha: 0.1)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? categoria.color
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                backgroundColor: categoria.color,
                                child: Icon(
                                  categoria.icon,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                categoria.name,
                                style: const TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              AppButton(
                text: "Guardar",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _sectionPhoto() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        Text(
          'Foto',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.grey,
                  ),
                  Text(
                    'Tomar foto',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
