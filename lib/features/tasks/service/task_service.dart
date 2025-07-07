import 'dart:js_interop';

import 'package:flutter/cupertino.dart';
import 'package:flutter_project/features/tasks/model/task.dart';
import 'package:flutter_project/features/tasks/service/itask_service.dart';
import 'package:sqflite/sqflite.dart';

class TaskService extends ITaskService{
  Database? _database;
  //singleton it
  TaskService._internal(){
    _openTaskConnection();
  }
  static final TaskService _instance = TaskService._internal();
  factory TaskService() => _instance;

  Future<void> _openTaskConnection() async {
    _database ??= await getTaskDatabaseService().openConnectionToDb();
  }

  void closeTaskDatabase(){
    getTaskDatabaseService().closeConnection();
  }

  @override
  Future<int> insertTask(Task task) async {
    int rows = 0;
    try {
      if (_database == null){
        debugPrint("Database null");
      }
      else {
        //definitely database not null
        rows = await _database!.insert('tasks', task.toJson());
      }
    } catch (e) {
      debugPrint('[Error] Cannot insert : ${ e.toString()}');
    }
    return rows;
  }

  @override
  Future<List<Task>> loadTasksFromDb() async {
    List<Task> tasks = [];
    late List<Map<String,Object?>> taskMaps;
    try {
      if (_database == null){
        debugPrint("Database null");
      }
      else {
        //definitely database not null
        taskMaps = await _database!.query('tasks');
        tasks = taskMaps.map((e) => Task.fromJson(e)).toList();
      }
    } catch (e) {
      debugPrint('[Error] Cannot load : ${ e.toString()}');
    }
    return tasks;
  }

  @override
  Future<bool> editTaskById(int taskId) async {
    // TODO: implement editTaskById
    return false;
  }

  @override
  Future<Task> findTaskById(int taskId) async {
    // TODO: implement findTaskById
    throw UnimplementedError();
  }

  @override
  Future<bool> removeTaskById(int taskId) async {
    // TODO: implement removeTaskById
    return false;
  }

  @override
  Future<bool> updateStatusById(int taskId) async {
    // TODO: implement updateStatusById
    return false;
  }

}