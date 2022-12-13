import 'meal_detail_model.dart';

class Meals {
  List<SpecifiedMeal> meals;

  Meals({this.meals});

  Meals.fromJson(Map<String, dynamic> json) {
    if (json['meals'] != null) {
      meals = <SpecifiedMeal>[];
      json['meals'].forEach((v) {
        meals.add(new SpecifiedMeal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meals != null) {
      data['meals'] = this.meals.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
