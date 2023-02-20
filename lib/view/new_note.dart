import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewNote extends StatelessWidget {
  NewNote({super.key});
  FocusNode noteFocus = FocusNode();
  TextEditingController titleContr = TextEditingController();
  TextEditingController contentContr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Note'),
        backgroundColor: Colors.black,
        toolbarHeight: 60,
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.check))],
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            TextField(
                controller: titleContr,
                onSubmitted: (val) {
                  if (val != "") {
                    noteFocus.requestFocus();
                  }
                },
                autofocus: true,
                style: const TextStyle(fontSize: 20, color: Colors.white),
                decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10),
                    hintText: "Title")),
            Expanded(
              child: TextField(
                  controller: contentContr,
                  focusNode: noteFocus,
                  maxLines: null,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                  decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10, top: 15),
                      hintText: "Type Something....")),
            ),
          ],
        ),
      ),
    );
  }
}
