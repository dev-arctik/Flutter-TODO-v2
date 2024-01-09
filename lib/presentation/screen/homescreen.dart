import 'package:flutter/material.dart';
import 'package:todo_app_v2/presentation/widget/addtodotextfield.dart';
import 'package:todo_app_v2/presentation/widget/todotile.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo App"),
        centerTitle: true,
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              TodoTile(),
              TodoTile(),
            ],
          ),
          AddTodoTextField()
        ],
      ),
    );
  }
}
