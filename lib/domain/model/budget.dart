import 'package:flutter/material.dart';

class Budget {
  final int id;
  final int idCategory;
  final String name;
  final String iconFileName;
  final Color color;
  final double maxAmount;
  final double total;

  Budget({
    required this.id,
    required this.idCategory,
    required this.name,
    required this.iconFileName,
    required this.color,
    required this.maxAmount,
    required this.total,
  });
}
