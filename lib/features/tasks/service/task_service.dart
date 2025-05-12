import 'package:flutter_project/features/tasks/model/task.dart';
import 'package:flutter_project/features/tasks/service/itask_service.dart';

class TaskService extends ITaskService{
  @override
  bool editTaskById(int taskId) {
    // TODO: implement editTaskById
    return false;
  }

  @override
  Task findTaskById(int taskId) {
    // TODO: implement findTaskById
    throw UnimplementedError();
  }

  @override
  Future<Task> insertTask(Task task) async {
    // TODO: implement insertTask
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> loadTasksFromDb() async {
    // TODO: implement loadTasksFromDb
    List<Task> task = [];
    return task;
  }

  @override
  bool removeTaskById(int taskId) {
    // TODO: implement removeTaskById
    return false;
  }

  @override
  bool updateStatusById(int taskId) {
    // TODO: implement updateStatusById
    return false;
  }

}