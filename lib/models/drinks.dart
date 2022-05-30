import 'package:json_annotation/json_annotation.dart';

part 'drinks.g.dart';

@JsonSerializable()
class Drinks {
  String idDrink;
  String strAlcoholic;
  String strCategory;
  String strCreativeCommonsConfirmed;
  String strDrink;
  String strDrinkThumb;
  String strGlass;
  String strInstructions;
  String? strInstructionsDE;
  String? strInstructionsIT;

  Drinks(
      {required this.idDrink,
      required this.strAlcoholic,
      required this.strCategory,
      required this.strCreativeCommonsConfirmed,
      required this.strDrink,
      required this.strDrinkThumb,
      required this.strGlass,
      required this.strInstructions,
      this.strInstructionsDE, this.strInstructionsIT});

  factory Drinks.fromJson(Map<String, dynamic> json) => _$DrinksFromJson(json);

  Map<String, dynamic> toJson() => _$DrinksToJson(this);
}
