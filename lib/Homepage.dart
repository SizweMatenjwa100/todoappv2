import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoappv3/dialogbox.dart';
import 'package:todoappv3/todotile.dart';
import 'package:hive/hive.dart';
import 'data/database.dart';
class Homepage extends StatefulWidget {

  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
final _controller= TextEditingController();
final _mybox=Hive.box('mybox');
toDoDatabase db = toDoDatabase();

@override
void initState(){
  if(_mybox.get("TODOLIST")==null){
    db.createInitialData();
  }
  else{
    db.loadData();
  }
super.initState();
}


  // Move the list inside the state class

  void saveNewTask() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        db.toDolist.add([_controller.text, false]);
        print("Added task: ${_controller.text}"); // Debug print
      }
      _controller.clear();
    });
    db.updateData();
    Navigator.of(context).pop(); // More explicit pop
  }

  void createNewTask() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onCancel: ()=> Navigator.of(context).pop(),
          onSave: saveNewTask

        );
      },
    );
  }

  void deleteTask(int index){
    setState(() {
      db.toDolist.removeAt(index);
    });
    db.updateData();

  }

  void checkBoxchanged(bool? value, int index) {
    setState(() {
      db.toDolist[index][1] = !db.toDolist[index][1];
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: Text(
          "To do",
          style: GoogleFonts.lobster(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDolist.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDolist[index][0],
            taskCompleted: db.toDolist[index][1],
            onChanged: (value) => checkBoxchanged(value, index),
            deleteFunction: (context)=> deleteTask(index),
          );
        },
      ),
    );
  }
}