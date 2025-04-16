import 'package:json_annotation/json_annotation.dart';
import 'package:kontar/domain/model/expense.dart';

part 'expense_dto.g.dart';

@JsonSerializable()
class ExpenseDto {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'amount')
  final double? amount;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'photoUrl')
  final String? photoUrl;

  @JsonKey(name: 'createdAt')
  final String? createdAt;

  ExpenseDto({
    required this.id,
    required this.amount,
    required this.description,
    required this.photoUrl,
    required this.createdAt,
  });

  factory ExpenseDto.fromJson(Map<String, dynamic> json) =>
      _$ExpenseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseDtoToJson(this);

  Expense toDomain() {
    return Expense(
      id: id ?? 0,
      amount: amount ?? 0.0,
      description: description ?? '',
      photoUrl: photoUrl ?? '',
      date: DateTime.parse(createdAt ?? ''),
    );
  }
}
