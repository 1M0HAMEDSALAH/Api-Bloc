import 'package:apibloc/bloc/character_event.dart';
import 'package:apibloc/bloc/character_state.dart';
import 'package:apibloc/services/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final ApiService apiService;

  CharacterBloc(this.apiService) : super(CharacterInitial()) {
    on<FetchCharactersEvent>((event, emit) async {
      try {
        emit(CharacterLoading());
        final characters = await apiService.fetchCharacters();
        emit(CharacterLoaded(characters));
      } catch (e) {
        emit(CharacterError(e.toString()));
      }
    });
  }
}
