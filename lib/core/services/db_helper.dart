import 'package:flutter/material.dart';
import 'package:just_task_it/apps/task_manager/models/task.dart';
import 'package:just_task_it/apps/task_manager/models/task_list.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {

  // Method for database() to create two tables.
  static void _createDb(Database db) {
    db.execute(
                'CREATE TABLE task_table(id TEXT PRIMARY KEY, title TEXT, description TEXT, isDone INTEGER, date TEXT, listId TEXT)');
    db.execute(
                'CREATE TABLE list_table(id TEXT PRIMARY KEY, title TEXT, color INTEGER, icon INTEGER)');
  }
  
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'just_task_it.db'),
            onCreate: (db, version) => _createDb(db), version: 1);
  }

  // Inserts Task into the table.
  static Future<void> insertTask(Task task) async {
    final db = await DBHelper.database();
    await db.insert(
      'task_table',
      task.toMap(),
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  // Inserts List into the table.
  static Future<void> insertTaskList(TaskList taskList) async {
    final db = await DBHelper.database();
    await db.insert(
      'list_table',
      taskList.toMap(),
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  // Deletes a task.
  static Future<void> deleteTask(String id) async {
    final db = await DBHelper.database();
    await db.delete(
      'task_table',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Deletes a list.
  static Future<void> deleteTaskList(String id) async {
    final db = await DBHelper.database();
    await db.delete(
      'list_table',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Updates a Task.
  static Future<void> updateTask(Task task) async {
    final db = await DBHelper.database();
    db.update(
      'task_table',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
      );
  }

  // Updates a Task List.
  static Future<void> updateTaskList(TaskList taskList) async {
    final db = await DBHelper.database();
    db.update(
      'list_table',
      taskList.toMap(),
      where: 'id = ?',
      whereArgs: [taskList.id],
      );
  }

  // Fetches all tasks.
  static Future<List<Task>> fetchTasks() async {
    final db = await DBHelper.database();
    final List<Map<String, dynamic>> maps = await db.query('task_table');
    return List.generate(maps.length, (i) {
      return Task(
        id: maps[i]['id'],
        title: maps[i]['title'],
        description: maps[i]['description'],
        isDone: maps[i]['isDone'] == 1 ? true : false,
        date: DateTime.parse(maps[i]['date']),
        listId: maps[i]['listId'],
      );
    });
  }

  // Fetches all Task Lists.
  static Future<List<TaskList>> fetchTaskLists() async {
    final db = await DBHelper.database();
    final List<Map<String, dynamic>> maps = await db.query('list_table');
    return List.generate(maps.length, (i) {
      return TaskList(
        id: maps[i]['id'],
        title: maps[i]['title'],
        color: maps[i]['color'],
        // Retrieves the codePoint for the IconData (int).
        icon: Icon(IconData(maps[i]['icon'], fontFamily: 'MaterialIcons')),
      );
    });
  }
  

}
