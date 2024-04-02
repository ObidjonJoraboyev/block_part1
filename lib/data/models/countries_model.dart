import 'package:block_part1/data/models/continent_model.dart';

class CountriesModel {
  final String code;
  final String name;
  final String phone;
  final String capital;
  final String currency;
  final String emoji;
  final ContinentModel continent;

  CountriesModel({
    required this.code,
    required this.name,
    required this.phone,
    required this.capital,
    required this.continent,
    required this.currency,
    required this.emoji,
  });

  factory CountriesModel.fromJson(Map<String, dynamic> json) {
    return CountriesModel(
        code: json["code"] as String? ?? "",
        name: json["name"] as String? ?? "",
        phone: json["phone"] as String? ?? "",
        capital: json["capital"] as String? ?? "",
        continent:
            ContinentModel.fromJson(json["continent"] as Map<String, dynamic>),
        currency: json["currency"] as String? ?? "",
        emoji: json["emoji"] as String? ?? "");
  }
}

//"code": "AD",
// "name": "Andorra",
// "phone": "376",
// "continent": {},
// "capital": "Andorra la Vella",
// "currency": "EUR",
// "emoji": "🇦🇩"
