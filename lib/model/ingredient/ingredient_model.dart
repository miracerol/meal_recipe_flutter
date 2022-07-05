import 'package:json_annotation/json_annotation.dart';
part 'ingredient_model.g.dart';
@JsonSerializable()
class Ingredient {
  List<MealsI>? meals;

  Ingredient({this.meals});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return _$IngredientFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$IngredientToJson(this);
  }
}

@JsonSerializable()
class MealsI {
  String? idIngredient;
  String? strIngredient;
  String? strDescription;
  String? strType;

  MealsI(
      {this.idIngredient,
        this.strIngredient,
        this.strDescription,
        this.strType});

  factory MealsI.fromJson(Map<String, dynamic> json) {
    return _$MealsIFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MealsIToJson(this);
  }
}
