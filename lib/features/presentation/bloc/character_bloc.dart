import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/data/models/character_model.dart';

import '../../domain/character_repository.dart';

enum CharacterState{initial, loading, loaded, failure}
enum CharacterSort{alphabet,status,species,gender,none}

class CharacterBloc extends ChangeNotifier{
  final CharacterRepository characterRepository;
  CharacterBloc({required this.characterRepository});


  List<CharacterModel> characters=[];
  int page=0;
  bool hasReachedMax = false;
  CharacterState _characterState =CharacterState.initial;
  CharacterSort _characterSort =CharacterSort.none;

  CharacterSort get characterSort => _characterSort;

  setCharacterSort(CharacterSort value) {
    _characterSort = value;
    notifyListeners();
  }

  CharacterState get characterState => _characterState;

  setCharacterState(CharacterState value) {
    _characterState = value;
    notifyListeners();
  }
  Future<void> getCharacters() async {
    page++;
    if(characterState!=CharacterState.initial){
      setCharacterState(CharacterState.loading);
    }
    if (hasReachedMax) setCharacterState(CharacterState.loaded);

    final characterData = await characterRepository.getCharacters(page);
    hasReachedMax = characterData.data==null || characterData.data?.info.next == null;

    characters = characterData.data!.characters.isEmpty ? characters : [...characters, ...characterData.data!.characters];

    setCharacterState(CharacterState.loaded);
    sortCharacters(_characterSort);
    notifyListeners();
  }

  void sortCharacters(CharacterSort characterSort) {
    setCharacterSort(characterSort);
    switch(characterSort){
      case CharacterSort.alphabet:
        characters.sort((a, b) => a.name.toString().compareTo(b.name.toString()));
        notifyListeners();
        break;
      case CharacterSort.status:
        characters.sort((a, b) => a.status.toString().compareTo(b.status.toString()));
        notifyListeners();
        break;
      case CharacterSort.species:
        // TODO: Handle this case.
        break;
      case CharacterSort.gender:
        characters.sort((a, b) => a.gender.toString().compareTo(b.gender.toString()));
        notifyListeners();
        break;
      case CharacterSort.none:
        // TODO: Handle this case.
        break;
    }


  }
}

