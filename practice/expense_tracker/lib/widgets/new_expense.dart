import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:expense_tracker/model/expense_structure.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({required this.onAddExpense, super.key});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  void _selectDate() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  Future<AlertDialog> _invalidExpenseData(
      String errorName, String toDisplayContent) async {
    if (Platform.isAndroid == true) {
      return await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(errorName),
          content: Text(toDisplayContent),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text(
                'Okay',
              ),
            ),
          ],
        ),
      );
    } else {
      return await showCupertinoDialog(
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
          title: Text(errorName),
          content: Text(toDisplayContent),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text('Okay')),
          ],
        ),
      );
    }
  }

  void _saveExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    //tryParse ('Hello') => null, tryParse ('1.12') => 1.12
    final amountIsInvalid = (enteredAmount == null || enteredAmount <= 0);

    if ((_titleController.text.trim().isEmpty && amountIsInvalid) ||
        (_titleController.text.trim().isEmpty && _selectedDate == null) ||
        (amountIsInvalid && _selectedDate == null) ||
        (amountIsInvalid &&
            _titleController.text.trim().isEmpty &&
            _selectedDate == null)) {
      _invalidExpenseData('INVALID INPUT', 'EMPTY INPUT FIELDS');
      return;
    } else if (_titleController.text.trim().isEmpty) {
      _invalidExpenseData('INVALID INPUT', 'TITLE FIELD CANNOT BE EMPTY');
      return;
    } else if (amountIsInvalid) {
      _invalidExpenseData('INVALID INPUT', 'AMOUNT FIELD CANNOT BE EMPTY');
      return;
    } else if (_selectedDate == null) {
      _invalidExpenseData('INVALID INPUT', 'SELECT DATE');
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 3),
        content: Text(
          'New Expense added',
        ),
      ),
    );
    widget.onAddExpense(
      Expense(
          title: _titleController.text.trim(),
          amount: enteredAmount,
          date: _selectedDate!,
          category: _selectedCategory),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(
      builder: (ctx, constraint) {
        final width = constraint.maxWidth;
        return SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 48, 16, keyboardSpace + 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (width >= 500)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _titleController,
                            maxLength: 50,
                            decoration: const InputDecoration(
                              label: Text('Title'),
                            ),
                            cursorColor: Colors.white,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _amountController,
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            decoration: const InputDecoration(
                              prefixText: '\u{20B9}',
                              label: Text('Amount'),
                            ),
                            cursorColor: Colors.white,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ],
                    )
                  else
                    TextField(
                      controller: _titleController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Title'),
                      ),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  if (width >= 500)
                    Row(
                      children: [
                        DropdownButton(
                          style: Theme.of(context).textTheme.titleMedium,
                          value: _selectedCategory,
                          items: Category.values
                              .map(
                                (category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(
                                    category.name.toUpperCase(),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }
                            setState(() {
                              _selectedCategory = value;
                            });
                          },
                        ),
                        const Spacer(),
                        Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 4,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton.icon(
                                onPressed: _selectDate,
                                icon: const Icon(Icons.calendar_month),
                                label: Text(
                                  _selectedDate == null
                                      ? 'no date selected'
                                      : formatter.format(_selectedDate!),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  else
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _amountController,
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            decoration: const InputDecoration(
                              prefixText: '\u{20B9}',
                              label: Text('Amount'),
                            ),
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 4,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton.icon(
                                onPressed: _selectDate,
                                icon: const Icon(Icons.calendar_month),
                                label: Text(
                                  _selectedDate == null
                                      ? 'no date selected'
                                      : formatter.format(_selectedDate!),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 50,
                  ),
                  if (width >= 500)
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            _saveExpenseData();
                          },
                          child: const Text('Save Expense'),
                        ),
                      ],
                    )
                  else
                    Row(
                      children: [
                        DropdownButton(
                          style: Theme.of(context).dropdownMenuTheme.textStyle,
                          value: _selectedCategory,
                          items: Category.values
                              .map(
                                (category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(
                                    category.name.toUpperCase(),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }
                            setState(() {
                              _selectedCategory = value;
                            });
                          },
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _saveExpenseData();
                              },
                              child: const Text('Save Expense'),
                            ),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
