import 'package:equatable/equatable.dart';
import '../models/character_model.dart';

abstract class CharacterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CharacterInitial extends CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterLoaded extends CharacterState {
  final List<Character> characters;

  CharacterLoaded(this.characters);

  @override
  List<Object?> get props => [characters];
}

class CharacterError extends CharacterState {
  final String message;

  CharacterError(this.message);

  @override
  List<Object?> get props => [message];
}
