import 'package:flutter/material.dart';
import 'package:food_delivery_test/models/meal_detail_model.dart';
import 'package:food_delivery_test/models/meals_model.dart';

class MealListItem extends StatelessWidget {
  final SpecifiedMeal meal;
  final function;
  const MealListItem({
    Key key,
    @required this.function,
    @required this.meal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        onTap: () {
          function();
        },
        leading: Image.network(
          meal.strMealThumb,
          height: MediaQuery.of(context).size.height * 1 / 5,
          width: MediaQuery.of(context).size.width * 1 / 10,
        ),
        title: Text(meal.strMeal),
      ),
    );
  }
}
