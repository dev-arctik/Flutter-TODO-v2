import 'package:flutter/material.dart';

class AddTodoTextField extends StatelessWidget {
  const AddTodoTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child: TextField(
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
            onPressed: () {},
            icon: Icon(Icons.add),
            iconSize: 40,
          )
        ],
      ),
    );
  }
}
