import 'package:expense_tracker/widgets/expense_list/expense_list.dart';
import 'package:expense_tracker/model/expense_structure.dart';
import 'package:expense_tracker/widgets/graph/chart.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({super.key});

  @override
  State<ExpenseTracker> createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverLay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      constraints: BoxConstraints(
        minHeight: 0,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: Text('Expense ${expense.title} Deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 330,
            height: 104,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'No expenses found. Start adding some!...',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                  onPressed: _openAddExpenseOverLay,
                  icon: const Icon(Icons.add),
                  label: const Text('Add Expenses'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = width < 600
          ? Column(
              children: [
                Chart(
                  expense: _registeredExpenses,
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: ExpenseList(
                    expenses: _registeredExpenses,
                    onRemoveExpense: _removeExpense,
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(
                    expense: _registeredExpenses,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: ExpenseList(
                    expenses: _registeredExpenses,
                    onRemoveExpense: _removeExpense,
                  ),
                ),
              ],
            );
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Expense Tracker',
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverLay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: mainContent,
    );
  }
}
