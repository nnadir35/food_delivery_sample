import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api/viewmodel/base_basket_view_model.dart';
import '../models/meal_detail_model.dart';
import 'basket_toggle.dart';

class AddToBasketIconButton extends StatefulWidget {
  final SpecifiedMeal meal;
  const AddToBasketIconButton({
    Key key,
    @required this.meal,
  }) : super(key: key);

  @override
  State<AddToBasketIconButton> createState() => _AddToBasketIconButtonState();
}

class _AddToBasketIconButtonState extends State<AddToBasketIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.read<BaseBasketViewModel>().addBasketToggle(widget.meal);
        },
        icon: itemBasketButton(context
            .watch<BaseBasketViewModel>()
            .isInBasket(widget.meal.idMeal)));
  }
}
