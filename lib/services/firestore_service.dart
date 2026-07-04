import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/models/expense_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addExpense(Expense expense) async {
    await _firestore.collection('expenses').add({
      'id': expense.id,
      'amount': expense.amount,
      'category': expense.category,
      'date': expense.date,
      'description': expense.description,
    });
  }

  Stream<List<Expense>> getExpenses() {
    return _firestore
        .collection('expenses')
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Expense.fromFirestore(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
  
  Future<void> deleteExpense(String id) async {
    await _firestore.collection('expenses').doc(id).delete();
  }
}
