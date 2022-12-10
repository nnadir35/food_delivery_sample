import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './favorites_view_model.dart';

class FavoritesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FavoritesViewModel>.reactive(
      viewModelBuilder: () => FavoritesViewModel(),
      onModelReady: (FavoritesViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        FavoritesViewModel model,
        Widget child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'FavoritesView',
            ),
          ),
        );
      },
    );
  }
}
