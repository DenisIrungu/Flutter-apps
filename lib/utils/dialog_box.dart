import 'package:flutter/material.dart';
import 'package:to_do_app/utils/mybotton.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
final controller;
VoidCallback onSave;
VoidCallback onCancel;

   DialogBox({super.key,
  required this.controller,
  required this.onSave,
  required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: Container( height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(border: OutlineInputBorder(),
            hintText: 'Add New Text'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Add Save Button
              MyButton(text: 'Save', onPressed: onSave),

              SizedBox(
                width: 12,
              ),
              //Add Cancel Button 
              MyButton(text: 'Cancel', onPressed: onCancel)
            ],
          )
        ],
      ),
      )
      ,
    );
  }
}