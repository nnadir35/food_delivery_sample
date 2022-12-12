import 'package:flutter/material.dart';
import 'package:food_delivery_test/models/meal_detail_model.dart';

class BasketListItem extends StatelessWidget {
  final SpecifiedMeal meal;
  final Function function;
  const BasketListItem({
    Key key,
    @required this.meal,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Image.network(
            meal.strMealThumb,
            height: MediaQuery.of(context).size.height * 1 / 5,
            width: MediaQuery.of(context).size.width * 1 / 10,
          ),
          title: Text(meal.strMeal),
          subtitle: Text(meal.comment ?? ""),
        ),
      ),
    );
  }
}
