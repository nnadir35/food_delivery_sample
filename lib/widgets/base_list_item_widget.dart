import 'package:flutter/material.dart';
import 'package:food_delivery_test/models/list_item_model.dart';

class BaseListItemWidget extends StatelessWidget {
  final ListItemModel model;
  final Function fun;
  const BaseListItemWidget({
    Key key,
    @required this.model,
    @required this.fun,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          onTap: () {
            fun();
          },
          leading: Image.network(
            model.thumb,
          ),
          title: Text(model.title,
              style: Theme.of(context).textTheme.headlineSmall),
          subtitle: Text(model.description, maxLines: 2),
        ),
      ),
    );
  }
}
