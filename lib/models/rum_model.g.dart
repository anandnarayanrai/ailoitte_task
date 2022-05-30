// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rum_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RumModel _$RumModelFromJson(Map<String, dynamic> json) => RumModel(
      drinks: (json['drinks'] as List<dynamic>?)
          ?.map((e) => Drinks.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..error = json['error'] as String?;

Map<String, dynamic> _$RumModelToJson(RumModel instance) => <String, dynamic>{
      'error': instance.error,
      'drinks': instance.drinks,
    };
