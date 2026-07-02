import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/models/expense_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add expense
  Future<void> addExpense(Expense expense) async {
    await _firestore.collection('expenses').add(expense.toMap());
  }

  // Get expenses for a specific user
  Stream<List<Expense>> getExpenses(String userId) {
    return _firestore
        .collection('expenses')
        .where('userId', isEqualTo: userId)
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Expense.fromMap(doc.data(), doc.id))
            .toList());
  }
}