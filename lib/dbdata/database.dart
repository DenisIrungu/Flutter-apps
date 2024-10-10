import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  //We reference the box

  final _myBox= Hive.box('myBox');


  //Run this method if it's the first time ever to run this app
  //Here we'll have our default tasks 
  void createInitialData () {
    toDoList= [
      ["Wake Up", false],
      ["Hydration", false]
    ];
  }

  // A method to load data
  void readData () {
    toDoList= _myBox.get("TODOLIST");

  }

  // A method to update data
  void updateData (){
    _myBox.put("TODOLIST", toDoList);


  }

}