import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:notes/ToDoList.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:build_runner/build_runner.dart';
import 'ToDoList.dart';
import 'HomePage.dart';

class ToDoDataBase {
  //reference box
  List toDoList = [];

  final _myBox = Hive.box('mybox');

  //First time opening the app

  void createInitialData() {
    toDoList = ['Make Coffee', false];
    ['Do Exercise', false];
  }
}

void loadData() {
  ToDoList = _myBox.get('toDoList');
}

//update the database

void updataDataBase() {
  _myBox.put('TODOLIST', ToDoDataBase);
}
