import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/database.dart';
import 'Addbox.dart';
import 'ToDoList.dart';
import 'database.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the box

  final _myBox = Hive.openBox('mybox');
  ToDoDataBase db = ToDoDataBase();
  @override
  void initState() {
//First time ever
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    // TODO: implement initState
    super.initState();
  }
  //text controller

  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
  }

  //save new task

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });

    Navigator.of(context).pop();
  }

//to add a new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return Addbox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
  }

  //checkbox tick untick
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: createNewTask,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          title: Text('hello'),
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: ((context, index) {
            return ToDoList(
                deleteFunction: (context) => deleteTask,
                taskName: db.toDoList[index][0],
                taskCompleted: db.toDoList[index][1],
                onChanged: (value) => checkBoxChanged(value, index));
          }),
        ));
  }
}
