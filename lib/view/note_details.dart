import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NotesDetails extends StatefulWidget {
  final String title;
  final String content;
  const NotesDetails({super.key, required this.content, required this.title});

  @override
  State<NotesDetails> createState() => _NotesDetailsState();
}

class _NotesDetailsState extends State<NotesDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          toolbarHeight: 60,
          elevation: 0,
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit))],
        ),
        body: Container(
          // margin: const EdgeInsets.symmetric(horizontal: 40),
          color: Colors.black,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: double.maxFinite,
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                width: double.maxFinite,
                child: Text(
                  widget.content,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              )
            ],
          ),
        ));
  }
}
