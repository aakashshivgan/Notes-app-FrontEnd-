import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/controller/bloc/notes_bloc.dart';
import 'package:notes_app/repositories/notes_repository.dart';
import 'package:notes_app/view/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // PostRepository postRepository = PostRepository();
  // postRepository.fetchNotes();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RepositoryProvider(
          create: (context) => NotesRepository(),
          child: const HomePage(),
        ));
  }
}
