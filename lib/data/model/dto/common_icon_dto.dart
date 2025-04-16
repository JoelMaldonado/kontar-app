import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kontrol_app/domain/model/common_icon.dart';

part 'common_icon_dto.g.dart';

@JsonSerializable()
class CommonIconDto {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'fileName')
  final String? fileName;

  CommonIconDto({
    required this.id,
    required this.name,
    required this.fileName,
  });

  factory CommonIconDto.fromJson(Map<String, dynamic> json) =>
      _$CommonIconDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CommonIconDtoToJson(this);

  CommonIcon toDomain() {
    return CommonIcon(
      id: id ?? 0,
      name: name ?? '',
      icon: iconMap[fileName] ?? Icons.error,
    );
  }
}

final Map<String, IconData> iconMap = {
  "fastfood": Icons.fastfood,
  "directions_bus": Icons.directions_bus,
  "coffee": Icons.coffee,
  "shopping_cart": Icons.shopping_cart,
  "home": Icons.home,
  "movie": Icons.movie,
  "medical_services": Icons.medical_services,
  "school": Icons.school,
  "fitness_center": Icons.fitness_center,
  "card_giftcard": Icons.card_giftcard,
  "attach_money": Icons.attach_money,
  "flight": Icons.flight,
  "local_taxi": Icons.local_taxi,
  "pets": Icons.pets,
  "receipt_long": Icons.receipt_long,
  "wifi": Icons.wifi,
  "cleaning_services": Icons.cleaning_services,
  "local_bar": Icons.local_bar,
  "local_gas_station": Icons.local_gas_station,
  "directions_car": Icons.directions_car,
};
