import 'package:flutter/material.dart';
import 'package:todoappv3/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,

              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add a new task"
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Save button
                mybutton(text: "Save", onPressed:onSave),
                const SizedBox(width: 9),
                // Cancel button
                mybutton(text: "Cancel", onPressed:onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
