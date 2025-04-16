// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpenseCategoryDto _$ExpenseCategoryDtoFromJson(Map<String, dynamic> json) =>
    ExpenseCategoryDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      iconFileName: json['iconFileName'] as String?,
      colorHex: json['colorHex'] as String?,
    );

Map<String, dynamic> _$ExpenseCategoryDtoToJson(ExpenseCategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconFileName': instance.iconFileName,
      'colorHex': instance.colorHex,
    };
