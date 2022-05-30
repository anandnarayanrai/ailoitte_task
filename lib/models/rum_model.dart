import 'package:json_annotation/json_annotation.dart';

import 'drinks.dart';

part 'rum_model.g.dart';

@JsonSerializable()
class RumModel {
  String? error;
  List<Drinks>? _drinks;

  RumModel({
    List<Drinks>? drinks,
  }) {
    _drinks = drinks;
  }

  RumModel.withError(String errorMessage) {
    error = errorMessage;
  }

  RumModel copyWith({
    List<Drinks>? drinks,
  }) => RumModel(
        drinks: drinks ?? _drinks,
      );

  List<Drinks>? get drinks => _drinks ?? [];

  factory RumModel.fromJson(Map<String, dynamic> json) =>
      _$RumModelFromJson(json);

  Map<String, dynamic> toJson() => _$RumModelToJson(this);
}
