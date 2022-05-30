// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drinks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Drinks _$DrinksFromJson(Map<String, dynamic> json) => Drinks(
      idDrink: json['idDrink'] as String,
      strAlcoholic: json['strAlcoholic'] as String,
      strCategory: json['strCategory'] as String,
      strCreativeCommonsConfirmed:
          json['strCreativeCommonsConfirmed'] as String,
      strDrink: json['strDrink'] as String,
      strDrinkThumb: json['strDrinkThumb'] as String,
      strGlass: json['strGlass'] as String,
      strInstructions: json['strInstructions'] as String,
      strInstructionsDE: json['strInstructionsDE'] as String?,
      strInstructionsIT: json['strInstructionsIT'] as String?,
    );

Map<String, dynamic> _$DrinksToJson(Drinks instance) => <String, dynamic>{
      'idDrink': instance.idDrink,
      'strAlcoholic': instance.strAlcoholic,
      'strCategory': instance.strCategory,
      'strCreativeCommonsConfirmed': instance.strCreativeCommonsConfirmed,
      'strDrink': instance.strDrink,
      'strDrinkThumb': instance.strDrinkThumb,
      'strGlass': instance.strGlass,
      'strInstructions': instance.strInstructions,
      'strInstructionsDE': instance.strInstructionsDE,
      'strInstructionsIT': instance.strInstructionsIT,
    };
