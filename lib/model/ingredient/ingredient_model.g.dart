// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient(
      meals: (json['meals'] as List<dynamic>?)
          ?.map((e) => Meals.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'meals': instance.meals,
    };

Meals _$MealsFromJson(Map<String, dynamic> json) => Meals(
      idIngredient: json['idIngredient'] as String?,
      strIngredient: json['strIngredient'] as String?,
      strDescription: json['strDescription'] as String?,
      strType: json['strType'] as String?,
    );

Map<String, dynamic> _$MealsToJson(Meals instance) => <String, dynamic>{
      'idIngredient': instance.idIngredient,
      'strIngredient': instance.strIngredient,
      'strDescription': instance.strDescription,
      'strType': instance.strType,
    };
