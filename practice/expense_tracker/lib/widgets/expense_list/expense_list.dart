import 'package:expense_tracker/widgets/expense_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense_structure.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {required this.onRemoveExpense, required this.expenses, super.key});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(1.0),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) => onRemoveExpense(expenses[index]),
        child: ExpenseItem(item: expenses[index]),
      ),
    );
  }
}
