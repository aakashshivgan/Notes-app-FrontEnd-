part of 'notes_bloc.dart';

@immutable
abstract class NotesState extends Equatable {}

// class NotesInitial extends NotesState {}

class NotesLoadingState extends NotesState {
  @override
  List<Object?> get props => [];
}

class NotesLoadedState extends NotesState {
  NotesLoadedState(this.notes);
  final List<Note> notes;
  @override
  List<Object?> get props => [notes];
}

class NotesErrorState extends NotesState {
  NotesErrorState(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}
// ignore: must_be_immutable
// class FetchCompleteNotesState extends NotesState {
 
// }

// class EmptyNoteState extends NotesState {}
