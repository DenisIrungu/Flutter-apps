import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/dbdata/database.dart';
import 'package:to_do_app/utils/dialog_box.dart';
import 'package:to_do_app/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
   HomePage ({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//Reference the Box

final _myBox = Hive.box('myBox');
// Create an Instance of our ToDoDataBase class
ToDoDataBase db= ToDoDataBase();

@override
  void initState() {
    //If this is the first time opening the app, then create default data
    if(_myBox.get("TODOLIST")== null) {
      db.createInitialData();
    }
    //Load or read the data
    else
    {
      db.readData();
    }
    super.initState();
  }

//Save New Task Method
  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  db.updateData();
  }

//Text controller
final _controller= TextEditingController();
//Create New Task method
void _createNeTask (){
  showDialog(
    context: context,
    builder: (context){
    return DialogBox(
      onSave: saveNewTask,
      onCancel:() => Navigator.of(context).pop(),
      controller: _controller);
      }
    );
}
//Delete Tasks
void deleteTask (int index){
  setState(() {
    db.toDoList.removeAt(index);
  });
db.updateData();
}

//CheckBox was tapped Method
void checkBoxChanged (bool? value, int index){
  setState(() {
db.toDoList [index][1]= !db.toDoList[index][1];
  });
db.updateData();

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        elevation: 0,
        title: Text('TO DO'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createNeTask,
        child: Icon(Icons.add), 
        backgroundColor: Colors.yellow,
        ),

      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTiles(
            taskName: db.toDoList[index][0],
            taskValue: db.toDoList[index][1],
            onChanged:(value) => checkBoxChanged (value, index),
            deleteFuction: (context) => deleteTask (index),
          );
        },
        
           )
    );
  }
}