import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/widgets/meal_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class DisplayMeals extends StatefulWidget {
  const DisplayMeals({
    super.key,
    required this.meal,
    required this.onSelectMeal,
  });

  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  @override
  State<DisplayMeals> createState() => _DisplayMealsState();
}

class _DisplayMealsState extends State<DisplayMeals>
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

  String get complexityText {
    return widget.meal.complexity.name[0].toUpperCase() +
        widget.meal.complexity.name.substring(1).toLowerCase();
  }

  String get affordabilityText {
    return widget.meal.affordability.name[0].toUpperCase() +
        widget.meal.affordability.name.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 5,
      child: InkWell(
        onTap: () {
          widget.onSelectMeal(widget.meal);
        },
        child: Stack(
          children: [
            Hero(
              tag: widget.meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(widget.meal.imageUrl),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      widget.meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MealTrait(
                          icon: Icons.alarm,
                          label: '${widget.meal.duration} min',
                        ),
                        MealTrait(
                          icon: Icons.work,
                          label: complexityText,
                        ),
                        MealTrait(
                          icon: Icons.currency_rupee,
                          label: affordabilityText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
