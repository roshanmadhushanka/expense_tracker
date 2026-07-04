import 'package:cloud_firestore/cloud_firestore.dart';

class Expense {
  final String id;
  final double amount;
  final String category;
  final DateTime date;
  final String description;

  Expense({
    required this.id,
    required this.amount,
    required this.category,
    required this.date,
    required this.description,
  });

  factory Expense.fromFirestore(Map<String, dynamic> data) {
    return Expense(
      id: data['id'],
      amount: data['amount'].toDouble(),
      category: data['category'],
      date: (data['date'] as Timestamp).toDate(),
      description: data['description'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'amount': amount,
      'category': category,
      'date': date,
      'description': description,
    };
  }
}
