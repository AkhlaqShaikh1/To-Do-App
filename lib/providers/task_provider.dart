import 'package:flutter/cupertino.dart';

import '../models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> tasks = [];

  addTask(Task newTask) {
    tasks.add(newTask);
    notifyListeners();
  }

  get getTask {
    return tasks;
  }

  removeTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }
}
