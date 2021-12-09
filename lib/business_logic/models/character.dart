import 'package:hive/hive.dart';

part 'character.g.dart';

@HiveType(typeId: 1)
class Character extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String status;

  @HiveField(3)
  String species;

  @HiveField(4)
  String type;

  @HiveField(5)
  String gender;

  @HiveField(6)
  String origin;

  @HiveField(7)
  String locationName;

  @HiveField(8)
  String imageURL;

  Character({
    required this.id, required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.locationName,
    required this.imageURL
});
  Character.name(this.id,
  this.name, this.status, this.species,
      this.type, this.gender, this.origin, this.locationName, this.imageURL);

  static List<Character> fromJSON(List json) {
    List<Character> characters = [];
    for (int i = 0; i < json.length; i++) {
      var char = Character.name(
          int.parse(json[i]['id']),
          json[i]['name'],
          json[i]['status'],
          json[i]['species'],
          json[i]['type'] ?? 'Unknown',
          json[i]['gender'],
          json[i]['origin']['name'] ?? 'Unknown',
          json[i]['location']['name'],
          json[i]['image']);
      characters.add(char);
    }
    return characters;
  }
}
