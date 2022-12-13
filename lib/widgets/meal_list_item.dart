import 'package:flutter/material.dart';
import 'package:food_delivery_test/models/meal_detail_model.dart';
import 'package:provider/provider.dart';

import '../api/viewmodel/base_categories_view_model.dart';
import 'favorite_toggle.dart';

class MealListItem extends StatefulWidget {
  final SpecifiedMeal meal;
  final Function function;
  final Function buttonOnPress;
  const MealListItem({
    Key key,
    @required this.function,
    @required this.meal,
    @required this.buttonOnPress,
  }) : super(key: key);

  @override
  State<MealListItem> createState() => _MealListItemState();
}

class _MealListItemState extends State<MealListItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            onTap: () {
              widget.function();
            },
            leading: Image.network(
              widget.meal.strMealThumb,
              height: MediaQuery.of(context).size.height * 1 / 5,
              width: MediaQuery.of(context).size.width * 1 / 10,
            ),
            title: Text(widget.meal.strMeal),
          ),
        ),
        IconButton(
            onPressed: () {
              widget.buttonOnPress();
            },
            icon: itemFavoriteButton(context
                .watch<BaseCategoriesViewModel>()
                .isFavorited(widget.meal.idMeal)))
      ],
    );
  }
}
