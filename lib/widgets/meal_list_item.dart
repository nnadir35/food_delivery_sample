import 'package:flutter/material.dart';
import '../models/meal_detail_model.dart';
import 'package:provider/provider.dart';

import '../api/viewmodel/base_categories_view_model.dart';
import 'add_to_favorite_icon_button.dart';
import 'favorite_toggle.dart';

class FavoritedMealListItem extends StatefulWidget {
  final SpecifiedMeal meal;
  final Function function;
  final Function buttonOnPress;
  const FavoritedMealListItem({
    Key key,
    @required this.function,
    @required this.meal,
    @required this.buttonOnPress,
  }) : super(key: key);

  @override
  State<FavoritedMealListItem> createState() => _FavoritedMealListItemState();
}

class _FavoritedMealListItemState extends State<FavoritedMealListItem> {
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
        AddToFavoriteIconButton(
          function: widget.buttonOnPress,
          value: widget.meal.idMeal,
        )
      ],
    );
  }
}
