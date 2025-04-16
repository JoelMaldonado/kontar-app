import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kontrol_app/domain/model/common_color.dart';

part 'common_color_dto.g.dart';

@JsonSerializable()
class CommonColorDto {
  @JsonKey(name: "id")
  final int? id;

  @JsonKey(name: "name")
  final String? name;

  @JsonKey(name: "hexCode")
  final String? hexCode;

  CommonColorDto({
    required this.id,
    required this.name,
    required this.hexCode,
  });

  factory CommonColorDto.fromJson(Map<String, dynamic> json) =>
      _$CommonColorDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CommonColorDtoToJson(this);

  CommonColor toDomain() {
    return CommonColor(
      id: id ?? 0,
      name: name ?? '',
      color:
          Color(int.parse(hexCode?.replaceFirst('#', '0xff') ?? '0xff000000')),
    );
  }
}
