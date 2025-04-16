import 'package:flutter/material.dart';

class CardExpense extends StatelessWidget {
  final String name;
  final double gastoActual;
  final double presupuestoMaximo;
  final Color color;

  const CardExpense({
    super.key,
    required this.name,
    required this.gastoActual,
    required this.presupuestoMaximo,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final porcentaje = (gastoActual / presupuestoMaximo).clamp(0.0, 1.0);

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                'S/ ${gastoActual.toStringAsFixed(0)} / ${presupuestoMaximo.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Barra de progreso
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: porcentaje,
              backgroundColor: Colors.grey.shade300,
              color: color,
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }
}
