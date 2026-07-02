class Expense {
  final String id;
  final double amount;
  final String description;
  final String category;
  final DateTime date;
  final String userId;

  Expense({
    required this.id,
    required this.amount,
    required this.description,
    required this.category,
    required this.date,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'description': description,
      'category': category,
      'date': date.toIso8601String(),
      'userId': userId,
    };
  }

  factory Expense.fromMap(Map<String, dynamic> map, String id) {
    return Expense(
      id: id,
      amount: map['amount']?.toDouble() ?? 0.0,
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      date: DateTime.parse(map['date']),
      userId: map['userId'] ?? '',
    );
  }
}