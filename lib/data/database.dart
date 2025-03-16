import 'package:hive/hive.dart';

class toDoDatabase {
  List toDolist = [];
  final _mybox = Hive.box('mybox'); // Reference to the Hive box

  // Initialize with some data
  void createInitialData() {
    toDolist = [
      ["Make Money", false],
      ["Do Exercise", false],
    ];
  }

  // Load data from Hive box
  void loadData() {
    var storedData = _mybox.get('TODOLIST');  // Fetch data from the Hive box
    if (storedData != null) {
      toDolist = List.from(storedData);  // Assign to the toDolist if data exists
    }
  }

  // Update the data in the Hive box
  void updateData() {
    _mybox.put('TODOLIST', toDolist);  // Save the updated list to Hive box
  }
}
