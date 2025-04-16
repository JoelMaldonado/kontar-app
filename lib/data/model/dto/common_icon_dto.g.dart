// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_icon_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonIconDto _$CommonIconDtoFromJson(Map<String, dynamic> json) =>
    CommonIconDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      fileName: json['fileName'] as String?,
    );

Map<String, dynamic> _$CommonIconDtoToJson(CommonIconDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fileName': instance.fileName,
    };
