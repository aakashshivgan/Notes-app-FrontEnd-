import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/repositories/notes_repository.dart';
import 'package:notes_app/storage/dummy_notes.dart';

import '../../model/note_model.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final NotesRepository notesRepository;
  NotesBloc(this.notesRepository) : super(NotesLoadingState()) {
    on<GetNotesEvent>((event, emit) async {
      emit(NotesLoadingState());
      try {
        final notes = await notesRepository.fetchNotes();

        emit(NotesLoadedState(notes));
      } catch (e) {
        emit(NotesErrorState(e.toString()));
      }
    });
  }
}
