import 'package:flutter/material.dart';
import 'package:food_delivery_test/models/list_item_model.dart';
import 'package:food_delivery_test/widgets/base_list_item_widget.dart';

class CategoryListItem extends StatelessWidget {
  final Function function;
  final ListItemModel model;
  const CategoryListItem({
    Key key,
    this.function,
    @required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function();
      },
      child: BaseListItemWidget(
        model: model,
      ),
    );
  }
}
