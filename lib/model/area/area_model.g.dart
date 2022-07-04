// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Area _$AreaFromJson(Map<String, dynamic> json) => Area(
      meals: (json['meals'] as List<dynamic>?)
          ?.map((e) => Meals.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AreaToJson(Area instance) => <String, dynamic>{
      'meals': instance.meals,
    };

Meals _$MealsFromJson(Map<String, dynamic> json) => Meals(
      strCategory: json['strCategory'] as String?,
    );

Map<String, dynamic> _$MealsToJson(Meals instance) => <String, dynamic>{
      'strCategory': instance.strCategory,
    };
