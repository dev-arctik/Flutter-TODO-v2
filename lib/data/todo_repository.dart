import 'package:hive_flutter/adapters.dart';

class TodoDatabase {
  List todolist = [];

  // refrence the box
  final _myBox = Hive.box("mybox");

  // run this only on the first intall
  void createIntialData() {
    todolist = [
      ["Create a new TODO", false]
    ];
  }

  // load the database
  void loadData() {
    todolist = _myBox.get("TODOLIST");
  }

  // update the database
  void updateData() {
    _myBox.put("TODOLIST", todolist);
  }
}
