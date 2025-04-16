import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kontar/core/utils/color_functions.dart';
import 'package:kontar/data/model/dto/common_icon_dto.dart';
import 'package:kontar/domain/model/expense_category.dart';

part 'expense_category_dto.g.dart';

@JsonSerializable()
class ExpenseCategoryDto {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'iconFileName')
  final String? iconFileName;

  @JsonKey(name: 'colorHex')
  final String? colorHex;

  ExpenseCategoryDto({
    required this.id,
    required this.name,
    required this.iconFileName,
    required this.colorHex,
  });

  factory ExpenseCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$ExpenseCategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseCategoryDtoToJson(this);

  ExpenseCategory toDomain() {
    return ExpenseCategory(
      id: id ?? 0,
      name: name ?? '',
      color: colorHex != null ? hexToColor(colorHex!) : Colors.transparent,
      icon: iconMap[iconFileName] ?? Icons.error,
    );
  }
}
