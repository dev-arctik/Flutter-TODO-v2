import 'package:flutter/material.dart';
import 'package:todo_app_v2/presentation/widget/addtodotextfield.dart';
import 'package:todo_app_v2/presentation/widget/todotile.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // List to store TO-DO tasks
    List<String> todoItems = ["Task 1", "Task 2"];

    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo App"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: todoItems.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  task: todoItems[index],
                );
              },
            ),
          ),
          const AddTodoTextField()
        ],
      ),
    );
  }
}
