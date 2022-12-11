import 'package:flutter/material.dart';

class MealListItem extends StatelessWidget {
  final url;
  final title;
  const MealListItem({
    Key key,
    @required this.url,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        url,
        height: MediaQuery.of(context).size.height * 1 / 5,
        width: MediaQuery.of(context).size.width * 1 / 10,
      ),
      title: Text(title),
    );
  }
}
