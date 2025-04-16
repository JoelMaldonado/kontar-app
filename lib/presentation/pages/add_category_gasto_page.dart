import 'package:flutter/material.dart';

class AsignarMontosPage extends StatelessWidget {
  const AsignarMontosPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulando categorías existentes
    final categorias = [
      {'nombre': 'Comida', 'icono': Icons.fastfood, 'color': Colors.green},
      {
        'nombre': 'Pasajes',
        'icono': Icons.directions_bus,
        'color': Colors.blue
      },
      {'nombre': 'Hormiga', 'icono': Icons.coffee, 'color': Colors.orange},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Asignar Montos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Asigna un monto máximo por categoría',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: categorias.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final categoria = categorias[index];
                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        // Ícono
                        CircleAvatar(
                          backgroundColor: categoria['color'] as Color,
                          child: Icon(
                            categoria['icono'] as IconData,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 12),

                        // Nombre
                        Expanded(
                          child: Text(
                            categoria['nombre'] as String,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        // Input de monto
                        SizedBox(
                          width: 100,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'S/ 0',
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text('Guardar montos', style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}
