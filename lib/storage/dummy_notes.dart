import '../model/note_model.dart';

class DummyNotes {
  List<Note> notes = [
    Note(title: "hello", content: "hello world"),
    Note(title: "hello", content: "hello world"),
    Note(title: "hello", content: "hello world"),
    Note(title: "hello", content: "hello world"),
  ];
  List<Note> get note => notes;
}

DummyNotes dummyNotes = DummyNotes();
