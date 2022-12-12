import 'package:flutter/material.dart';
import 'package:food_delivery_test/enum/preference_keys.dart';
import 'package:food_delivery_test/manager/locale_storage_manager.dart';
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
            itemCount: 1,
            itemBuilder: (BuildContext buildContext, int index) {
              return ListTile(
                title: TextButton(
                  onPressed: () async {
                    LocalStorageManager.instance.initSharedPref();
                    await LocalStorageManager.instance
                        .clear(PreferencesKeys.favorites);
                  },
                  child: Text("sadf"),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
