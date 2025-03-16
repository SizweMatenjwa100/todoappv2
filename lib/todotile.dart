import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class  ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({super.key, required this.taskCompleted, required this.taskName, required this.onChanged, required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 25, 25,0),
      child:Slidable(
        endActionPane: ActionPane(motion: StretchMotion(),
            children: [
          SlidableAction(onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.black,
            borderRadius: BorderRadius.circular(12),
          )
            ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          child:Row(
            children: [
              Checkbox(value: taskCompleted, onChanged: onChanged),
              Text(taskName, style: TextStyle(decoration: taskCompleted? TextDecoration.lineThrough : TextDecoration.none),),

            ],
          ),

          decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(12)),

        ),
      ),
    );
  }

}
