import 'package:flutter/material.dart';
import 'package:food_delivery_test/models/list_item_model.dart';
import 'package:food_delivery_test/models/meal_detail_model.dart';
import 'package:food_delivery_test/widgets/base_list_item_widget.dart';

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
      child: BaseListItemWidget(
        model: ListItemModel(
            description: widget.meal.comment,
            thumb: widget.meal.strMealThumb,
            title: widget.meal.strMeal),
        fun: () {
          widget.function();
        },
      ),
    );
  }
}
