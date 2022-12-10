import 'package:flutter/material.dart';
import 'package:food_delivery_test/ui/master/master_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:provider/provider.dart';
import './basket_view_model.dart';

class BasketView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BasketViewModel>.reactive(
      viewModelBuilder: () => BasketViewModel(),
      onModelReady: (BasketViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        BasketViewModel model,
        Widget child,
      ) {
        return Scaffold(
          body: ListView.builder(
            itemCount: context.read<MasterViewModel>().dummy.length,
            itemBuilder: (BuildContext BuilderContext, int index) {
              return ListTile(
                title: Text(
                    context.read<MasterViewModel>().dummy[index].toString()),
              );
            },
          ),
        );
      },
    );
  }
}
