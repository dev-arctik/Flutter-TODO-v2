import 'package:flutter/material.dart';
import 'package:todo_app_v2/presentation/widget/addtodotextfield.dart';
import 'package:todo_app_v2/presentation/widget/todotile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List to store TO-DO tasks
  List todoItems = [
    ["Task1", false],
    ["Task2", false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoItems[index][1] = !todoItems[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  taskName: todoItems[index][0],
                  taskCompleted: todoItems[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
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
