// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCategoryRequest _$CreateCategoryRequestFromJson(
        Map<String, dynamic> json) =>
    CreateCategoryRequest(
      name: json['name'] as String,
      idIcon: (json['idIcon'] as num).toInt(),
      idColor: (json['idColor'] as num).toInt(),
    );

Map<String, dynamic> _$CreateCategoryRequestToJson(
        CreateCategoryRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'idIcon': instance.idIcon,
      'idColor': instance.idColor,
    };
