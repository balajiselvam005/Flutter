import 'package:expense_tracker/model/expense_structure.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({required this.item, super.key});

  final Expense item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(
                bottom: 3,
                top: 0,
              ),
              child: Divider(
                color: Colors.black,
                height: 5,
              ),
            ),
            Row(
              children: [
                Text(
                  '\u{20B9}${item.amount.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      categoryIcon[item.category],
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      item.formattedDate.toString(),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
