class Character {
  final String name;
  final String height;
  final String mass;
  final String gender;
  final String hairColor;
  final String skinColor;
  final String eyeColor;
  final String birthYear;
  final String urlHomeWorld;
  final List speciesUrl;
  String homeWorld;
  String specie;

  Character(
      {this.name = '',
      this.height = '',
      this.mass = '',
      this.gender = '',
      this.hairColor = '',
      this.skinColor = '',
      this.eyeColor = '',
      this.birthYear = '',
      this.urlHomeWorld = '',
      this.homeWorld,
      this.specie,
      this.speciesUrl});

  factory Character.fromJson(Map<String, dynamic> json) {
    if (json.containsKey("name")) {
      return Character(
          name: json["name"],
          height: json["height"],
          mass: json["mass"],
          gender: json["gender"],
          hairColor: json["hair_color"],
          skinColor: json["skin_color"],
          eyeColor: json["eye_color"],
          birthYear: json["birth_year"],
          urlHomeWorld: json["homeworld"],
          speciesUrl: json["species"]);
    } else {
      return Character(
          name: json["CharacterName"],
          height: json["height"],
          mass: json["mass"],
          gender: json["gender"],
          hairColor: json["hair_color"],
          skinColor: json["skin_color"],
          eyeColor: json["eye_color"],
          birthYear: json["birth_year"],
          homeWorld: json["homeWorld"],
          specie: json["specie"]);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "CharacterName": name,
      "height": height,
      "mass": mass,
      "gender": gender,
      "hairColor": hairColor,
      "skinColor": skinColor,
      "eyeColor": eyeColor,
      "birthYear": birthYear,
      "homeWorld": homeWorld,
      "specie": specie,
    };
  }
}
