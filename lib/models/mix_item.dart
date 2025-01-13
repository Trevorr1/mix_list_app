import 'package:json_annotation/json_annotation.dart';
import 'package:mix_list_app/models/recipe.dart';

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
