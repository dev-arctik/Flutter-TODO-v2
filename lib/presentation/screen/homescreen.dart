import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app_v2/data/todo_repository.dart';
import 'package:todo_app_v2/presentation/widget/addtodotextfield.dart';
import 'package:todo_app_v2/presentation/widget/todotile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // refrence hive box
  final _myBox = Hive.box('mybox');
  TodoDatabase todoDatabase = TodoDatabase();

  @override
  void initState() {
    // if first time open app then create defualt datalist
    if (_myBox.get("TODOLIST") == null) {
      todoDatabase.createIntialData();
    } else {
      // there already exist data
      todoDatabase.loadData();
    }

    super.initState();
  }

  // text editing controller
  final _taskTextController = TextEditingController();

  // checkbox tapped complete the task
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoDatabase.todolist[index][1] = !todoDatabase.todolist[index][1];
      todoDatabase.updateData();
    });
  }

  // add new task in the list
  void addNewTask() {
    if (_taskTextController.text != "") {
      setState(() {
        todoDatabase.todolist.add([_taskTextController.text, false]);
        _taskTextController.clear();
        todoDatabase.updateData();
      });
    }
  }

  // delete task when click on delete icon
  void deleteTask(int index) {
    setState(() {
      todoDatabase.todolist.removeAt(index);
      todoDatabase.updateData();
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
              itemCount: todoDatabase.todolist.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  taskName: todoDatabase.todolist[index][0],
                  taskCompleted: todoDatabase.todolist[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                  onDelete: () => deleteTask(index),
                );
              },
            ),
          ),
          AddTodoTextField(
            taskTextController: _taskTextController,
            addTask: addNewTask,
          )
        ],
      ),
    );
  }
}
