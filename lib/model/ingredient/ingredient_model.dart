import 'package:json_annotation/json_annotation.dart';
part 'ingredient_model.g.dart';
@JsonSerializable()
class Ingredient {
  List<Meals>? meals;

  Ingredient({this.meals});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return _$IngredientFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$IngredientToJson(this);
  }
}

@JsonSerializable()
class Meals {
  String? idIngredient;
  String? strIngredient;
  String? strDescription;
  String? strType;

  Meals(
      {this.idIngredient,
        this.strIngredient,
        this.strDescription,
        this.strType});

  factory Meals.fromJson(Map<String, dynamic> json) {
    return _$MealsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MealsToJson(this);
  }
}
