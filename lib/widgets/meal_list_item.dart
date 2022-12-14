import 'package:flutter/material.dart';
import 'package:food_delivery_test/models/list_item_model.dart';
import 'package:food_delivery_test/widgets/base_list_item_widget.dart';
import '../models/meal_detail_model.dart';
import 'package:provider/provider.dart';

import '../api/viewmodel/base_categories_view_model.dart';
import 'add_to_favorite_icon_button.dart';
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
          child: BaseListItemWidget(
              model: new ListItemModel(
                  description: "",
                  thumb: widget.meal.strMealThumb,
                  title: widget.meal.strMeal)),
        ),
        AddToFavoriteIconButton(
          function: widget.buttonOnPress,
          value: widget.meal.idMeal,
        )
      ],
    );
  }
}
