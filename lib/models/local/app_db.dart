import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../entities/tasks.dart';

part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(
    () async {
      // Get app folder location
      final dbFolder = await getApplicationDocumentsDirectory();

      // Put the file todo.sqlite in app folder
      final file = File(path.join(dbFolder.path, 'db.sqlite'));

      return NativeDatabase(file);
    },
  );
}

@DriftDatabase(
  tables: [
    Tasks,
  ],
)
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Stream<List<Task>> getCurrentTasks() {
    return (select(tasks)..where((tbl) => tbl.isCompleted.equals(false)))
        .watch();
  }

  Stream<List<Task>> getCompletedTasks() {
    return (select(tasks)..where((tbl) => tbl.isCompleted.equals(true)))
        .watch();
  }

  Future<int> insertTask(TasksCompanion entity) {
    return into(tasks).insert(entity);
  }

  Future<bool> updateTask(TasksCompanion entity) {
    return update(tasks).replace(entity);
  }

  Future<int> deleteTask(int taskId) {
    return (delete(tasks)..where((tbl) => tbl.id.equals(taskId))).go();
  }
}
