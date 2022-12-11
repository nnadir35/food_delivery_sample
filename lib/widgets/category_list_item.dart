import 'package:flutter/material.dart';

class CategoryListItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final Function function;
  const CategoryListItem({
    Key key,
    @required this.image,
    @required this.title,
    @required this.description,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Image.network(
            image,
            height: MediaQuery.of(context).size.height * 1 / 5,
            width: MediaQuery.of(context).size.width * 1 / 10,
          ),
          title: Text(title),
          subtitle: Text(description, maxLines: 3),
        ),
      ),
    );
  }
}
