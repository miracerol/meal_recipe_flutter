import 'package:json_annotation/json_annotation.dart';

part 'meal_model.g.dart';

@JsonSerializable()
class Meal {
  List<Meals>? meals;

  Meal({this.meals});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return _$MealFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MealToJson(this);
  }
}

@JsonSerializable()
class Meals {
  String? idMeal;
  String? strMeal;
  String? strDrinkAlternate;
  String? strCategory;
  String? strArea;
  String? strInstructions;
  String? strMealThumb;
  String? strTags;
  String? strYoutube;
  String? strIngredient1;
  String? strIngredient2;
  String? strIngredient3;
  String? strIngredient4;
  String? strIngredient5;
  String? strIngredient6;
  String? strIngredient7;
  String? strIngredient8;
  String? strIngredient9;
  String? strIngredient10;
  String? strIngredient11;
  String? strIngredient12;
  String? strIngredient13;
  String? strIngredient14;
  String? strIngredient15;
  String? strIngredient16;
  String? strIngredient17;
  String? strIngredient18;
  String? strIngredient19;
  String? strIngredient20;
  String? strMeasure1;
  String? strMeasure2;
  String? strMeasure3;
  String? strMeasure4;
  String? strMeasure5;
  String? strMeasure6;
  String? strMeasure7;
  String? strMeasure8;
  String? strMeasure9;
  String? strMeasure10;
  String? strMeasure11;
  String? strMeasure12;
  String? strMeasure13;
  String? strMeasure14;
  String? strMeasure15;
  String? strMeasure16;
  String? strMeasure17;
  String? strMeasure18;
  String? strMeasure19;
  String? strMeasure20;
  String? strSource;
  String? strImageSource;
  String? strCreativeCommonsConfirmed;
  String? dateModified;

  Meals(
      {this.idMeal,
      this.strMeal,
      this.strDrinkAlternate,
      this.strCategory,
      this.strArea,
      this.strInstructions,
      this.strMealThumb,
      this.strTags,
      this.strYoutube,
      this.strIngredient1,
      this.strIngredient2,
      this.strIngredient3,
      this.strIngredient4,
      this.strIngredient5,
      this.strIngredient6,
      this.strIngredient7,
      this.strIngredient8,
      this.strIngredient9,
      this.strIngredient10,
      this.strIngredient11,
      this.strIngredient12,
      this.strIngredient13,
      this.strIngredient14,
      this.strIngredient15,
      this.strIngredient16,
      this.strIngredient17,
      this.strIngredient18,
      this.strIngredient19,
      this.strIngredient20,
      this.strMeasure1,
      this.strMeasure2,
      this.strMeasure3,
      this.strMeasure4,
      this.strMeasure5,
      this.strMeasure6,
      this.strMeasure7,
      this.strMeasure8,
      this.strMeasure9,
      this.strMeasure10,
      this.strMeasure11,
      this.strMeasure12,
      this.strMeasure13,
      this.strMeasure14,
      this.strMeasure15,
      this.strMeasure16,
      this.strMeasure17,
      this.strMeasure18,
      this.strMeasure19,
      this.strMeasure20,
      this.strSource,
      this.strImageSource,
      this.strCreativeCommonsConfirmed,
      this.dateModified});

  factory Meals.fromJson(Map<String, dynamic> json) {
    return _$MealsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MealsToJson(this);
  }

  List<String> getIngAsList() {
    List<String> list = [];
    if (strIngredient1 != "" && strIngredient1 != null) {
      list.add(strIngredient1!);
    }
    if (strIngredient2 != "" && strIngredient2 != null) {
      list.add(strIngredient2!);
    }
    if (strIngredient3 != "" && strIngredient3 != null) {
      list.add(strIngredient3!);
    }
    if (strIngredient4 != "" && strIngredient4 != null) {
      list.add(strIngredient4!);
    }
    if (strIngredient5 != "" && strIngredient5 != null) {
      list.add(strIngredient5!);
    }
    if (strIngredient6 != "" && strIngredient6 != null) {
      list.add(strIngredient6!);
    }
    if (strIngredient7 != "" && strIngredient7 != null) {
      list.add(strIngredient7!);
    }
    if (strIngredient8 != "" && strIngredient8 != null) {
      list.add(strIngredient8!);
    }
    if (strIngredient9 != "" && strIngredient9 != null) {
      list.add(strIngredient9!);
    }
    if (strIngredient10 != "" && strIngredient10 != null) {
      list.add(strIngredient10!);
    }
    if (strIngredient11 != "" && strIngredient11 != null) {
      list.add(strIngredient11!);
    }
    if (strIngredient12 != "" && strIngredient12 != null) {
      list.add(strIngredient12!);
    }
    if (strIngredient13 != "" && strIngredient13 != null) {
      list.add(strIngredient13!);
    }
    if (strIngredient14 != "" && strIngredient14 != null) {
      list.add(strIngredient14!);
    }
    if (strIngredient15 != "" && strIngredient15 != null) {
      list.add(strIngredient15!);
    }
    if (strIngredient16 != "" && strIngredient16 != null) {
      list.add(strIngredient16!);
    }
    if (strIngredient17 != "" && strIngredient17 != null) {
      list.add(strIngredient17!);
    }
    if (strIngredient18 != "" && strIngredient18 != null) {
      list.add(strIngredient18!);
    }
    if (strIngredient19 != "" && strIngredient19 != null) {
      list.add(strIngredient19!);
    }
    if (strIngredient20 != "" && strIngredient20 != null) {
      list.add(strIngredient20!);
    }
    return list;
  }

  List<String> getMeasureAsList() {
    int size = getIngAsList().length;
    List<String> list = [];
    if (strMeasure1 != "" && strMeasure1 != null) {
      list.add(strMeasure1!);
    } else if (list.length < size) {
      list.add(" ");
    }
    if (strMeasure2 != "" && strMeasure2 != null) {
      list.add(strMeasure2!);
    } else if (list.length < size) {
      list.add(" ");
    }

    if (strMeasure3 != "" && strMeasure3 != null) {
      list.add(strMeasure3!);
    } else if (list.length < size) {
      list.add(" ");
    }
    if (strMeasure4 != "" && strMeasure4 != null) {
      list.add(strMeasure4!);
    } else if (list.length < size) {
      list.add(" ");
    }
    if (strMeasure5 != "" && strMeasure5 != null) {
      list.add(strMeasure5!);
    } else if (list.length < size) {
      list.add(" ");
    }
    if (strMeasure6 != "" && strMeasure6 != null) {
      list.add(strMeasure6!);
    } else if (list.length < size) {
      list.add(" ");
    }
    if (strMeasure7 != "" && strMeasure7 != null) {
      list.add(strMeasure7!);
    } else if (list.length < size) {
      list.add(" ");
    }
    if (strMeasure8 != "" && strMeasure8 != null) {
      list.add(strMeasure8!);
    } else if (list.length < size) {
      list.add(" ");
    }
    if (strMeasure9 != "" && strMeasure9 != null) {
      list.add(strMeasure9!);
    } else if (list.length < size) {
      list.add(" ");
    }
    if (strMeasure10 != "" && strMeasure10 != null) {
      list.add(strMeasure10!);
    } else if (list.length < size) {
      list.add(" ");
    }
    if (strMeasure11 != "" && strMeasure11 != null) {
      list.add(strMeasure11!);
    } else if (list.length < size) {
      list.add(" ");
    }
    if (strMeasure12 != "" && strMeasure12 != null) {
      list.add(strMeasure12!);
    } else if (list.length < size) {
      list.add(" ");
    }
    if (strMeasure13 != "" && strMeasure13 != null) {
      list.add(strMeasure13!);
    } else if (list.length < size) {
      list.add(" ");
    }
    if (strMeasure14 != "" && strMeasure14 != null) {
      list.add(strMeasure14!);
    } else if (list.length < size) {
      list.add(" ");
    }
    if (strMeasure15 != "" && strMeasure15 != null) {
      list.add(strMeasure15!);
    } else if (list.length < size) {
      list.add(" ");
    }
    if (strMeasure16 != "" && strMeasure16 != null) {
      list.add(strMeasure16!);
    } else if (list.length < size) {
      list.add(" ");
    }
    if (strMeasure17 != "" && strMeasure17 != null) {
      list.add(strMeasure17!);
    } else if (list.length < size) {
      list.add(" ");
    }
    if (strMeasure18 != "" && strMeasure18 != null) {
      list.add(strMeasure18!);
    } else if (list.length < size) {
      list.add(" ");
    }
    if (strMeasure19 != "" && strMeasure19 != null) {
      list.add(strMeasure19!);
    } else if (list.length < size) {
      list.add(" ");
    }
    if (strMeasure20 != "" && strMeasure20 != null) {
      list.add(strMeasure20!);
    } else if ((list.isNotEmpty ? list.length : 0) < size) {
      list.add(" ");
    }
    return list;
  }

  String getShareText() {
    String text = "";
    text += "$strMeal\n";
    text += "Category: $strCategory\n";
    text += "Area: $strArea\n\n";
    text += "Instructions\n$strInstructions\n\n";
    text += "Ingredients:\n";
    List<String> ing = getIngAsList();
    for (int i = 0; i < ing.length; i++) {
      text += "${ing[i]} ${ing[i]}\n";
    }
    return text;
  }
}
