part of 'notes_bloc.dart';

@immutable
abstract class NotesEvent extends Equatable {}

class GetNotesEvent extends NotesEvent {
  @override
  List<Object?> get props => [];
}

// class AddNotesEvent extends NotesEvent {}

// class UpdateNotesEvent extends NotesEvent {}

// class DeleteNotesEvent extends NotesEvent {}

// class ViewDetailsNotesEvent extends NotesEvent {}
