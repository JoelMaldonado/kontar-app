// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_color_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonColorDto _$CommonColorDtoFromJson(Map<String, dynamic> json) =>
    CommonColorDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      hexCode: json['hexCode'] as String?,
    );

Map<String, dynamic> _$CommonColorDtoToJson(CommonColorDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'hexCode': instance.hexCode,
    };
