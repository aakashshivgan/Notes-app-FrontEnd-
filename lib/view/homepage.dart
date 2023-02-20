import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/controller/bloc/notes_bloc.dart';
import 'package:notes_app/repositories/notes_repository.dart';
import 'package:notes_app/view/new_note.dart';

import '../model/note_model.dart';
import 'dart:math' as math;

import 'note_details.dart';

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
          backgroundColor: Colors.black,
          toolbarHeight: 60,
          elevation: 0,
          title: const Text(
            'Notes',
            style: TextStyle(fontSize: 30),
          ),
          // centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  // notesBloc.add(GetNotesEvent());
                },
                icon: const Icon(Icons.search_rounded))
          ],
        ),
        body: Container(
          color: Colors.black,
          child: BlocBuilder<NotesBloc, NotesState>(
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
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotesDetails(
                                  title: state.notes[index].title!,
                                  content: state.notes[index].content!),
                            )),
                        child: Container(
                          height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Color(
                                      (math.Random().nextDouble() * 0xFFFFFF)
                                          .toInt())
                                  .withOpacity(1.0),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 30),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    textAlign: TextAlign.start,
                                    state.notes[index].title!,
                                    style: GoogleFonts.robotoSlab(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                  // Text(state.notes[index].id!)
                                ]),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              return Container();
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
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
