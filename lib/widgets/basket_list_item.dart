import 'package:flutter/material.dart';

class BasketListItem extends StatelessWidget {
  final String image;
  final String title;
  final Function function;
  const BasketListItem({
    Key key,
    @required this.image,
    @required this.title,
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
        ),
      ),
    );
  }
}
