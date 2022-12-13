import 'package:flutter/material.dart';
import 'package:food_delivery_test/models/meal_detail_model.dart';

class BasketListItem extends StatefulWidget {
  final SpecifiedMeal meal;
  final Function function;
  const BasketListItem({
    Key key,
    @required this.meal,
    this.function,
  }) : super(key: key);

  @override
  State<BasketListItem> createState() => _BasketListItemState();
}

class _BasketListItemState extends State<BasketListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.function();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Image.network(
            widget.meal.strMealThumb,
            height: MediaQuery.of(context).size.height * 1 / 5,
            width: MediaQuery.of(context).size.width * 1 / 10,
          ),
          title: Text(widget.meal.strMeal),
          subtitle: Text(widget.meal.comment ?? ""),
        ),
      ),
    );
  }
}
