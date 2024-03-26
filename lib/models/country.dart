import 'dart:convert';

List<CountryModel> countryModelFromJson(String str) => List<CountryModel>.from(
    json.decode(str).map((x) => CountryModel.fromJson(x)));

String countryModelToJson(List<CountryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryModel {
  final String? flag;
  final String country;
  final String? code;

  CountryModel({
    required this.country,
    this.flag,
    this.code,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        flag: json["flag"],
        country: json["country"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "flag": flag,
        "country": country,
        "code": code,
      };
}
