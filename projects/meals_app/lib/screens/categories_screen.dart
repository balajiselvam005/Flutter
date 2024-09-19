import 'package:flutter/material.dart';

import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/categories_item.dart';
import 'package:meals_app/model/category.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
  });
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Route _createRoute(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => MealsScreen(
        title: category.title,
        meals: filteredMeals,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // return AnimatedBuilder(
    //     animation: _animationController,
    //     child: GridView(
    //       padding: const EdgeInsets.all(24),
    //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 2,
    //         childAspectRatio: 3 / 2,
    //         crossAxisSpacing: 20,
    //         mainAxisSpacing: 20,
    //       ),
    //       children: [
    //         for (final category in availableCategories)
    //           CategoriesItem(
    //             category: category,
    //             onSelectCategory: () => _selectCategory(context, category),
    //           ),
    //       ],
    //     ),
    //     builder: (context, child) => SlideTransition(
    // position: Tween(
    //   begin: const Offset(0, 0.3),
    //   end: const Offset(0, 0),
    // ).animate(
    //   CurvedAnimation(
    //     parent: _animationController,
    //     curve: Curves.bounceInOut,
    //   ),
    // ),
    //child: child);
    return SlideTransition(
      position: Tween(
        begin: const Offset(0, 0.3),
        end: const Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.bounceInOut,
        ),
      ),
      child: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoriesItem(
              category: category,
              onSelectCategory: () =>
                  Navigator.of(context).push(_createRoute(context, category)),
            ),
        ],
      ),
    );
  }
}
