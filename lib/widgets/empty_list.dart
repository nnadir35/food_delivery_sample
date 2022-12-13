import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppConstants.emptyList),
    );
  }
}
