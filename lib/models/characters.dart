class Character {
  final String name;
  final String height;
  final String mass;
  final String gender;
  final String hair_color;
  final String skin_color;
  final String eye_color;
  final String birth_year;
  final String homeworld;

  Character(
      {this.name = '',
      this.height = '',
      this.mass = '',
      this.gender = '',
      this.hair_color = '',
      this.skin_color = '',
      this.eye_color = '',
      this.birth_year = '',
      this.homeworld = ''});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json["name"],
      height: json["height"],
      mass: json["mass"],
      gender: json["gender"],
      hair_color: json["hair_color"],
      skin_color: json["skin_color"],
      eye_color: json["eye_color"],
      birth_year: json["birth_year"],
      homeworld: json["homeworld"],
    );
  }
}
