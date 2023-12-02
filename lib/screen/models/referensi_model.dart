import 'dart:convert';

class RandomMeal {
  List<Map<String, String?>> meals;

  RandomMeal({
    required this.meals,
  });

  factory RandomMeal.fromRawJson(String str) =>
      RandomMeal.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RandomMeal.fromJson(Map<String, dynamic> json) => RandomMeal(
        meals: List<Map<String, String?>>.from(json["meals"].map(
            (x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
      );

  Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals.map(
            (x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
      };
}
