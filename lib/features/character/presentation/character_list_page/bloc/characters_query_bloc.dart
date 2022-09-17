import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'characters_query_event.dart';
part 'characters_query_state.dart';

class CharactersQueryBloc extends Bloc<CharactersQueryEvent, CharactersQueryState> {
  CharactersQueryBloc() : super(CharactersQueryInitial()) {
    on<CharactersQueryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
