import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../constants/app_constants.dart';
import '../../widgets/add_to_basket_icon_button.dart';
import 'basket_detail_view_model.dart';

class BasketDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BasketDetailViewModel>.reactive(
      viewModelBuilder: () => BasketDetailViewModel(context),
      onModelReady: (BasketDetailViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        BasketDetailViewModel model,
        Widget child,
      ) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(model.getBasketItem.strMealThumb),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(model.getBasketItem.strMeal),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(AppConstants.defineCategory +
                          model.getBasketItem.strCategory),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(AppConstants.defineArea +
                          model.getBasketItem.strArea),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AddToBasketIconButton(meal: model.getBasketItem)
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                          controller: model.commentController,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            model.setItemComment();
                          },
                          child: Text(AppConstants.save))
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
