import 'package:flutter/material.dart';

class TodoTile extends StatefulWidget {
  final String task;

  const TodoTile({super.key, required this.task});

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.brown[50]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  value: isCompleted,
                  onChanged: (value) {
                    setState(() {
                      isCompleted = value!;
                    });
                  },
                ),
                Text(
                  widget.task,
                  style: TextStyle(
                      decoration: isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                )
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete_outline_rounded),
            )
          ],
        ),
      ),
    );
  }
}
