import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/controller/bloc/notes_bloc.dart';
import 'package:notes_app/repositories/notes_repository.dart';
import 'package:notes_app/view/new_note.dart';

import '../model/note_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesBloc(
        RepositoryProvider.of<NotesRepository>(context),
      )..add(GetNotesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notes App'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  // notesBloc.add(GetNotesEvent());
                },
                icon: const Icon(Icons.replay))
          ],
        ),
        body: BlocBuilder<NotesBloc, NotesState>(
          builder: (context, state) {
            if (state is NotesLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is NotesLoadedState) {
              List<Note> noteList = state.notes;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: noteList.length,
                itemBuilder: (context, index) {
                  return const Card(
                    elevation: 10,
                    color: Colors.blue,
                  );
                },
              );
            }
            return Container();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => NewNote(),
                ));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
