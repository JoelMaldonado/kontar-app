import 'package:flutter/material.dart';

class ExpenseCategory {
  final int id;
  final String name;
  final Color color;
  final IconData icon;

  ExpenseCategory({
    required this.id,
    required this.name,
    required this.color,
    required this.icon,
  });
}
