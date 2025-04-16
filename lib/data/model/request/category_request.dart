import 'package:json_annotation/json_annotation.dart';

part 'category_request.g.dart';

@JsonSerializable()
class CreateCategoryRequest {
  final String name;
  final int idIcon;
  final int idColor;

  CreateCategoryRequest({
    required this.name,
    required this.idIcon,
    required this.idColor,
  });

  factory CreateCategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateCategoryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCategoryRequestToJson(this);
}
