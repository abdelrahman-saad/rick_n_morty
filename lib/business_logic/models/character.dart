class Character {

  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  String origin;
  String locationName;
  String imageURL;

  Character.name(this.id, this.name, this.status, this.species, this.type,
      this.gender, this.origin, this.locationName, this.imageURL);

  static List<Character> fromJSON(List json) {
    List<Character> characters = [];
    for (int i = 0; i < json.length; i++) {
      var char= Character.name(
          int.parse(json[i]['id']),
          json[i]['name'],
          json[i]['status'],
          json[i]['species'],
          json[i]['type']??'Unknown',
          json[i]['gender'],
          json[i]['origin']['name']??'Unknown',
          json[i]['location']['name'],
          json[i]['image']);
      characters.add(char);
    }
    return characters;

  }
}
