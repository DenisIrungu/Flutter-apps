import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoTiles extends StatelessWidget {
  final String taskName;
  final bool taskValue;
  Function (bool?)? onChanged;
  Function(BuildContext)? deleteFuction;


  ToDoTiles({super.key, 
    required this.taskName,
    required this.taskValue,
    required this.onChanged,
    required this.deleteFuction
   });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteFuction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),)
          ]),


        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              //CheckBox
              Checkbox(value: taskValue, onChanged: onChanged),
        
              //Task name
              Text(taskName, style: TextStyle(decoration: taskValue? TextDecoration.lineThrough:TextDecoration.none),),
            ],
          ),
          decoration: BoxDecoration(color: Colors.yellow,
          borderRadius: BorderRadius.circular(12)),
          
        ),
      ),
    );
  }
}