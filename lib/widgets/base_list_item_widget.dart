import 'package:flutter/material.dart';
import 'package:food_delivery_test/models/list_item_model.dart';

class BaseListItemWidget extends StatelessWidget {
  final ListItemModel model;
  const BaseListItemWidget({
    Key key,
    @required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          leading: Image.network(
            model.thumb,
          ),
          title: Text(model.title),
          subtitle: Text(model.description, maxLines: 2),
        ),
      ),
    );
  }
}
