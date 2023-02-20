import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/repositories/api/api.dart';

class NotesRepository {
  API api = API();

  Future<List<Note>> fetchNotes() async {
    Response response = await http.get(Uri.parse("${api.baseUrl}/notes/list"));
    if (response.body.isNotEmpty) {
      final List result = jsonDecode(response.body);
      return result.map((e) => Note.fromJson(e)).toList();
    } else {
      throw Exception("error");
    }
  }

  void addNotes() async {
    await http.post(Uri.parse("${api.baseUrl}/notes/add"));
  }
}
