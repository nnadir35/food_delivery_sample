class MealWithDetail {
  List<SpecifiedMeal> meals;

  MealWithDetail({this.meals});

  MealWithDetail.fromJson(Map<String, dynamic> json) {
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

class SpecifiedMeal {
  String idMeal;
  String strMeal;
  String strCategory;
  String strArea;
  String strInstructions;
  String strMealThumb;
  String strTags;
  String comment;

  SpecifiedMeal(
      {this.idMeal,
      this.strMeal,
      this.strCategory,
      this.strArea,
      this.strInstructions,
      this.strMealThumb,
      this.strTags,
      this.comment});

  SpecifiedMeal.fromJson(Map<String, dynamic> json) {
    idMeal = json['idMeal'];
    comment = json['comment'];
    strMeal = json['strMeal'];
    strCategory = json['strCategory'];
    strArea = json['strArea'];
    strInstructions = json['strInstructions'];
    strMealThumb = json['strMealThumb'];
    strTags = json['strTags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment'] = this.comment;
    data['idMeal'] = this.idMeal;
    data['strMeal'] = this.strMeal;
    data['strCategory'] = this.strCategory;
    data['strArea'] = this.strArea;
    data['strInstructions'] = this.strInstructions;
    data['strMealThumb'] = this.strMealThumb;
    data['strTags'] = this.strTags;
    return data;
  }
}
