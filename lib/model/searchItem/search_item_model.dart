import 'package:json_annotation/json_annotation.dart';
part 'search_item_model.g.dart';

@JsonSerializable()
class SearchItem {
  List<ItemS>? meals;

  SearchItem({this.meals});

  factory SearchItem.fromJson(Map<String, dynamic> json) {
    return _$SearchItemFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SearchItemToJson(this);
  }
}
@JsonSerializable()
class ItemS {
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

  ItemS(
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

  factory ItemS.fromJson(Map<String, dynamic> json) {
    return _$ItemSFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ItemSToJson(this);
  }
}