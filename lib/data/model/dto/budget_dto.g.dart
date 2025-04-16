// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BudgetDto _$BudgetDtoFromJson(Map<String, dynamic> json) => BudgetDto(
      id: (json['id'] as num?)?.toInt(),
      idCategory: (json['idCategory'] as num?)?.toInt(),
      name: json['name'] as String?,
      iconFileName: json['iconFileName'] as String?,
      colorHex: json['colorHex'] as String?,
      maxAmount: (json['maxAmount'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BudgetDtoToJson(BudgetDto instance) => <String, dynamic>{
      'id': instance.id,
      'idCategory': instance.idCategory,
      'name': instance.name,
      'iconFileName': instance.iconFileName,
      'colorHex': instance.colorHex,
      'maxAmount': instance.maxAmount,
      'total': instance.total,
    };
