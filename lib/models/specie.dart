class Specie {
  String name;

  Specie({this.name});

  factory Specie.fromJson(Map<String, dynamic> json) {
    return Specie(name: json["name"]);
  }
}
