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
  String? strMeal;
  String? strMealThumb;
  String? idMeal;

  ItemS({this.strMeal, this.strMealThumb, this.idMeal});

  factory ItemS.fromJson(Map<String, dynamic> json) {
    return _$ItemSFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ItemSToJson(this);
  }
}
