import 'dart:convert';

List<CountryData> dataFromJson(String str) => List<CountryData>.from(
    json.decode(str).map((x) => CountryData.fromJson(x)));

class CountryData {
  CountryInfo countryInfo;
  String country;
  int population;
  int cases;
  int tests;
  int deaths;
  int recovered;
  int active;

  CountryData(
      {required this.countryInfo,
      required this.country,
      required this.active,
      required this.population,
      required this.cases,
      required this.tests,
      required this.deaths,
      required this.recovered});

  factory CountryData.fromJson(Map<String, dynamic> json) => CountryData(
      countryInfo: CountryInfo.fromJson(json['countryInfo']),
      country: json['country'],
      active: json['active'],
      population: json['population'],
      cases: json['cases'],
      tests: json['tests'],
      deaths: json['deaths'],
      recovered: json['recovered']);
}

class CountryInfo {
  String flag;

  CountryInfo({required this.flag});

  factory CountryInfo.fromJson(Map<String, dynamic> json) =>
      CountryInfo(flag: json['flag']);
}
