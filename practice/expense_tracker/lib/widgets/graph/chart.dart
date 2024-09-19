import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense_structure.dart';
import 'package:expense_tracker/widgets/graph/chart_bar.dart';

class Chart extends StatelessWidget {
  const Chart({
    super.key,
    required this.expense,
  });
  final List<Expense> expense;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expense, Category.food),
      ExpenseBucket.forCategory(expense, Category.leisure),
      ExpenseBucket.forCategory(expense, Category.travel),
      ExpenseBucket.forCategory(expense, Category.work),
    ];
  }

  double get maxExpense {
    double maxExpense = 0;
    for (final bucket in buckets) {
      if (bucket.totalExpense > maxExpense) {
        maxExpense = bucket.totalExpense;
      }
    }
    return maxExpense;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 8,
        ),
        width: double.infinity,
        height: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.3),
              Theme.of(context).colorScheme.primary.withOpacity(0),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (final bucket in buckets)
                    ChartBar(
                      fill: bucket.totalExpense == 0
                          ? 0
                          : bucket.totalExpense / maxExpense,
                    )
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: buckets
                  .map(
                    (bucket) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Icon(
                          categoryIcon[bucket.category],
                          color: isDarkMode
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.7),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
