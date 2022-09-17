part of 'characters_query_bloc.dart';

abstract class CharactersQueryState extends Equatable {
  const CharactersQueryState();
}

class CharactersQueryInitial extends CharactersQueryState {
  @override
  List<Object> get props => [];
}
