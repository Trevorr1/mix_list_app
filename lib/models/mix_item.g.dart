// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mix_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MixItem _$MixItemFromJson(Map<String, dynamic> json) => MixItem(
      json['name'] as String,
      json['description'] as String,
      json['type'] as String,
      (json['recipes'] as List<dynamic>)
          .map((e) => Recipe.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MixItemToJson(MixItem instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
      'recipes': instance.recipes,
    };
