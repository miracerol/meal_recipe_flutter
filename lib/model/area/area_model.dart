import 'package:json_annotation/json_annotation.dart';
part 'area_model.g.dart';

@JsonSerializable()
class Area {
  List<Meals>? meals;

  Area({this.meals});

  factory Area.fromJson(Map<String, dynamic> json) {
    return _$AreaFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AreaToJson(this);
  }
}
@JsonSerializable()
class Meals {
  String? strCategory;

  Meals({this.strCategory});

  factory Meals.fromJson(Map<String, dynamic> json) {
    return _$MealsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MealsToJson(this);
  }
}
