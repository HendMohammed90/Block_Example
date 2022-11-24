import 'package:bloc/bloc.dart';
import 'package:breaking_project/data/models/character.dart';
import 'package:breaking_project/data/repo/character_repo.dart';
import 'package:meta/meta.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit(this.characterRepo) : super(CharacterInitial());
  final CharacterRepo characterRepo;
  List<Character> resultList = [];
  List<Character> getAllCharacter() {
    characterRepo.getAllCharacter().then((list) {
      emit(CharacterLoaded((list)));
      resultList = list;
    });
    return resultList;
  }
}
