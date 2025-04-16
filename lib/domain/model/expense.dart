class Expense {
  final int id;
  final double amount;
  final String description;
  final String photoUrl;
  final DateTime date;

  Expense({
    required this.id,
    required this.amount,
    required this.description,
    required this.photoUrl,
    required this.date,
  });
}
