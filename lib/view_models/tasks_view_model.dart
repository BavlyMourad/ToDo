import 'package:flutter/material.dart';

import '../models/local/app_db.dart';

class TasksViewModel with ChangeNotifier {
  AppDb? _appDb;

  void initAppDb(AppDb db) {
    _appDb = db;
  }

  List<Task> _currentTasks = [];
  List<Task> _completedTasks = [];

  List<Task> get currentTasks => _currentTasks;
  List<Task> get completedTasks => _completedTasks;

  void getAllTasks() {
    _appDb!.getCurrentTasks().listen(
      (value) {
        _currentTasks = value;
        notifyListeners();
      },
    );

    _appDb!.getCompletedTasks().listen(
      (value) {
        _completedTasks = value;
        notifyListeners();
      },
    );
  }

  void addTask(TasksCompanion entity) {
    _appDb!.insertTask(entity);
    notifyListeners();
  }

  void editTask(TasksCompanion entity) {
    _appDb!.updateTask(entity);
    notifyListeners();
  }

  void deleteTask(int taskId) {
    _appDb!.deleteTask(taskId);
    notifyListeners();
  }
}
