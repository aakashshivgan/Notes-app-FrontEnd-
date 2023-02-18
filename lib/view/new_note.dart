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
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              Card(
                  margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  elevation: 10,
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
                          style: const TextStyle(fontSize: 20),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 10),
                              hintText: "Title")),
                      const Divider(
                        thickness: 0.1,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 500,
                        width: double.maxFinite,
                        child: TextField(
                            controller: contentContr,
                            focusNode: noteFocus,
                            maxLines: null,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.only(left: 10, top: 15),
                                hintText: "Content")),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 200,
                child:
                    ElevatedButton(onPressed: () {}, child: const Text("Add")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
