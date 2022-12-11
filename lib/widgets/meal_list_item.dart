import 'package:flutter/material.dart';
import 'package:food_delivery_test/models/meals_model.dart';

class MealListItem extends StatelessWidget {
  final Meal meal;
  final function;
  const MealListItem({
    Key key,
    @required this.function,
    @required this.meal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function();
      },
      leading: Image.network(
        meal.strMealThumb,
        height: MediaQuery.of(context).size.height * 1 / 5,
        width: MediaQuery.of(context).size.width * 1 / 10,
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.star,
            color: Colors.amber,
          )),
      title: Text(meal.strMeal),
    );
  }
}
