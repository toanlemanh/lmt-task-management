import '../model/task.dart';

abstract class ITaskService {
  //connect DB ???
  Future<List<Task>> loadTasksFromDb();

  Future<Task> insertTask(Task task);
  bool removeTaskById(int taskId);
  Task findTaskById(int taskId);
  bool editTaskById(int taskId);
  bool updateStatusById(int taskId);
}