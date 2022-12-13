import 'package:flutter/material.dart';
import 'favorite_toggle.dart';
import 'meal_list_item.dart';
import 'package:provider/provider.dart';
import '../api/viewmodel/base_categories_view_model.dart';

class AddToFavoriteIconButton extends StatefulWidget {
  final Function function;
  final String value;
  const AddToFavoriteIconButton({
    Key key,
    @required this.function,
    @required this.value,
  }) : super(key: key);

  @override
  State<AddToFavoriteIconButton> createState() =>
      _AddToFavoriteIconButtonState();
}

class _AddToFavoriteIconButtonState extends State<AddToFavoriteIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          widget.function();
        },
        icon: itemFavoriteButton(context
            .watch<BaseCategoriesViewModel>()
            .isFavorited(widget.value)));
  }
}
