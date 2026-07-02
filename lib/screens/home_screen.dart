import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:expense_tracker/services/auth_service.dart';
import 'package:expense_tracker/services/firestore_service.dart';
import 'package:expense_tracker/models/expense_model.dart';

class HomeScreen extends StatelessWidget {
  final User user;

  const HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final firestoreService = context.read<FirestoreService>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Expenses'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => context.read<AuthService>().signOut(),
          ),
        ],
      ),
      body: StreamBuilder<List<Expense>>(
        stream: firestoreService.getExpenses(user.uid),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final expenses = snapshot.data ?? [];

          return ListView.builder(
            itemCount: expenses.length,
            itemBuilder: (context, index) {
              final expense = expenses[index];
              return ListTile(
                leading: const Icon(Icons.receipt_long),
                title: Text(expense.description),
                subtitle: Text(expense.category),
                trailing: Text(
                  '\$${expense.amount.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddExpenseDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddExpenseDialog(BuildContext context) {
    final amountController = TextEditingController();
    final descController = TextEditingController();
    final categoryController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Add Expense'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: amountController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Amount')),
            TextField(controller: descController, decoration: const InputDecoration(labelText: 'Description')),
            TextField(controller: categoryController, decoration: const InputDecoration(labelText: 'Category')),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              final newExpense = Expense(
                id: DateTime.now().toString(),
                amount: double.tryParse(amountController.text) ?? 0.0,
                description: descController.text,
                category: categoryController.text,
                date: DateTime.now(),
                userId: user.uid,
              );
              await context.read<FirestoreService>().addExpense(newExpense);
              Navigator.of(ctx).pop();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}