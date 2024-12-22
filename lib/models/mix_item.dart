import 'package:json_annotation/json_annotation.dart';

part 'mix_item.g.dart';

@JsonSerializable()
class MixItem {
  String name;
  String description;
  String type;
  List<Recipe> recipes;

  MixItem(this.name, this.description, this.type, this.recipes);

  factory MixItem.fromJson(Map<String, dynamic> json) =>
      _$MixItemFromJson(json);

  Map<String, dynamic> toJson() => _$MixItemToJson(this);
}

@JsonSerializable()
class Recipe {
  String base;
  String add;

  Recipe(this.base, this.add);

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
