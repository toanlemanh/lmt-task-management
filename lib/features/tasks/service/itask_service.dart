
import 'package:sqflite/sqflite.dart';

import '../../../core/database/database_service.dart';
import '../model/task.dart';

abstract class ITaskService {
  //allow TaskService to reuse that function
  DatabaseService getTaskDatabaseService() {
    //connect task database service
    DatabaseService databaseService = DatabaseService();
    // Unused: Database database = await databaseService.openConnectionToDb();
    return databaseService;
  }
  Future<List<Task>> loadTasksFromDb();

  Future<int> insertTask(Task task);
  Future<bool> removeTaskById(int taskId);
  Future<Task?> findTaskById(int taskId);
  Future<bool> editTaskById(int taskId);
  Future<bool> updateStatusById(int taskId);
}