import 'package:flutter/material.dart';

class AddTodoTextField extends StatelessWidget {
  final taskTextController;
  VoidCallback addTask;

  AddTodoTextField(
      {super.key, required this.taskTextController, required this.addTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: taskTextController,
            decoration: InputDecoration(
                hintText: "Add your TODO",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                filled: true,
                fillColor: Colors.grey[100],
                focusColor: Colors.transparent),
            autocorrect: true,
          )),
          const SizedBox(width: 4),
          IconButton.filled(
            onPressed: addTask,
            icon: const Icon(Icons.add),
            iconSize: 40,
          )
        ],
      ),
    );
  }
}
