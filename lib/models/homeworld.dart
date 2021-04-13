class HomeWorld {
  String name;

  HomeWorld({this.name});

  factory HomeWorld.fromJson(Map<String, dynamic> json) {
    return HomeWorld(
      name: json["name"],
    );
  }
}
