class GlobalData {
  num active;
  num recovered;
  num deaths;

  GlobalData(
      {required this.active, required this.recovered, required this.deaths});

  factory GlobalData.fromJson(Map<String, dynamic> json) => GlobalData(
      active: json['active'],
      recovered: json['recovered'],
      deaths: json['deaths']);

  Map<String, dynamic> toJson() =>
      {"active": active, "recovered": recovered, "deaths": deaths};
}
