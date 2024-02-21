import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  TodoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged});

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
                Checkbox(value: taskCompleted, onChanged: onChanged),
                Text(
                  taskName,
                  style: TextStyle(
                      decoration: taskCompleted
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
