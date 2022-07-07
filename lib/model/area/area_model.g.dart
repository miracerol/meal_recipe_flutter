// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Area _$AreaFromJson(Map<String, dynamic> json) => Area(
      meals: (json['meals'] as List<dynamic>?)
          ?.map((e) => MealsA.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AreaToJson(Area instance) => <String, dynamic>{
      'meals': instance.meals,
    };

MealsA _$MealsAFromJson(Map<String, dynamic> json) => MealsA(
      strArea: json['strArea'] as String?,
    );

Map<String, dynamic> _$MealsAToJson(MealsA instance) => <String, dynamic>{
      'strArea': instance.strArea,
    };
