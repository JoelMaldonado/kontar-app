import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kontar/core/utils/color_functions.dart';
import 'package:kontar/domain/model/budget.dart';

part 'budget_dto.g.dart';

@JsonSerializable()
class BudgetDto {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'idCategory')
  final int? idCategory;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'iconFileName')
  final String? iconFileName;
  @JsonKey(name: 'colorHex')
  final String? colorHex;
  @JsonKey(name: 'maxAmount')
  final double? maxAmount;
  @JsonKey(name: 'total')
  final double? total;

  BudgetDto({
    required this.id,
    required this.idCategory,
    required this.name,
    required this.iconFileName,
    required this.colorHex,
    required this.maxAmount,
    required this.total,
  });

  factory BudgetDto.fromJson(Map<String, dynamic> json) =>
      _$BudgetDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BudgetDtoToJson(this);

  Budget toDomain() {
    return Budget(
      id: id ?? 0,
      idCategory: idCategory ?? 0,
      name: name ?? '',
      iconFileName: iconFileName ?? '',
      color: colorHex != null ? hexToColor(colorHex!) : Colors.transparent,
      maxAmount: maxAmount ?? 0.0,
      total: total ?? 0.0,
    );
  }
}
