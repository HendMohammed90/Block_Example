import 'package:breaking_project/data/web_services/charcter_service.dart';
import '../models/character.dart';

class CharacterRepo {
  final CharacterWebServices characterWebServices;

  CharacterRepo(this.characterWebServices);
  Future<List<Character>> getAllCharacter() async {
    try {
      final characters = await characterWebServices.fetchAllCharacter();
      // print(characters);
      return characters!
          .map((character) => Character.fromJson(character))
          .toList();
    } catch (e) {
      print(e.toString());
      // return 'null';
      return [];
    }
  }
}
