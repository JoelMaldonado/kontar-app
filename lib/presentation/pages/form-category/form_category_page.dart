import 'package:flutter/material.dart';
import 'package:kontrol_app/domain/model/common_color.dart';
import 'package:kontrol_app/domain/model/common_icon.dart';
import 'package:kontrol_app/presentation/pages/form-category/form_category_provider.dart';
import 'package:kontrol_app/presentation/widgets/app_button.dart';
import 'package:kontrol_app/presentation/widgets/widgets.dart';
import 'package:provider/provider.dart';

class FormCategoryPage extends StatefulWidget {
  const FormCategoryPage({super.key});

  @override
  State<FormCategoryPage> createState() => _FormCategoryPageState();
}

class _FormCategoryPageState extends State<FormCategoryPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<FormCategoryProvider>(
        context,
        listen: false,
      ).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FormCategoryProvider>(context);
    provider.onSuccess = () => Navigator.pop(context, true);
    return AppScaffold(
      appBar: AppBar(
        title: Text("Agregar categoría"),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 24,
            children: [
              AppTextField(
                label: "Nombre de la categoría",
                hint: "Ej: Comida, Transporte...",
                controller: provider.nameController,
              ),
              _sectionIcons(
                selectedIcon: provider.selectedIcon,
                listIcons: provider.icons,
                onIconSelected: provider.setIcon,
              ),
              _sectionColors(
                selectedColor: provider.selectedColor,
                listColors: provider.colors,
                onColorSelected: provider.setColor,
              ),
              AppButton(
                text: "Guardar",
                onPressed: provider.saveCategory,
                isLoading: provider.isLoadingSaveCategory,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionIcons({
    required CommonIcon? selectedIcon,
    required List<CommonIcon> listIcons,
    required Function(CommonIcon) onIconSelected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        const Text(
          'Icono',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: listIcons.map((e) {
            final isSelected = e == selectedIcon;
            return GestureDetector(
              onTap: () => onIconSelected(e),
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color:
                      isSelected ? Colors.blue.shade50 : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? Colors.blue : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: Icon(
                  e.icon,
                  size: 32,
                  color: isSelected ? Colors.blue : Colors.grey.shade700,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _sectionColors({
    required CommonColor? selectedColor,
    required List<CommonColor> listColors,
    required Function(CommonColor) onColorSelected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        const Text(
          'Color',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: listColors.map((e) {
            final isSelected = e == selectedColor;
            return GestureDetector(
              onTap: () => onColorSelected(e),
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: e.color,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? Colors.black : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: isSelected
                    ? const Icon(Icons.check, color: Colors.white)
                    : null,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
