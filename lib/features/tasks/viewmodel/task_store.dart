

import 'package:flutter_project/features/tasks/model/priority_enum.dart';
import 'package:flutter_project/features/tasks/model/task_category.dart';
import 'package:flutter_project/features/tasks/service/itask_service.dart';
import 'package:mobx/mobx.dart';

import '../model/task.dart';
import '../model/task_difficulty.dart';

part 'task_store.g.dart';

class TaskStore = _TaskStoreBase with _$TaskStore;
abstract class _TaskStoreBase with Store{
  @readonly
  late String _title;

  @readonly
  late String _detail;

  @readonly
  bool _isDone = false;

  @readonly
  late String _categoryEnum = TaskCategory.work.label;

  @readonly
  late int _priorityEnum = TaskPriority.veryLow.value;

  @readonly
  late int _difficultyEnum = TaskDifficulty.veryEasy.value;

  @readonly
  late DateTime _startDate;

  @readonly
  late DateTime _estimateDate;

  @readonly
  DateTime? _completeDate;

  @readonly
  String? _imagePath;

  @readonly
  bool _isActive = true; // dated or outdated

  @readonly
  late DateTime _createDate;

  @readonly
  DateTime? _updatedDate;

  @readonly
  String? _error;

  late final ITaskService taskService;
  _TaskStoreBase({required ITaskService taskService});

  @action
  void setDone() {
    _isDone = !_isDone;
  }

  @action
  void setDetail(String detail) {
    _detail = detail;
  }

  @action
  void setTitle(String title) {
    _title = title;
  }
  

  @action
  void setStartDate(DateTime startDate){
    _startDate = startDate;
  }

  @action
  void setEstimateDate(DateTime estimateDate){
    _estimateDate = estimateDate;
  }

  @action
  void setImagePath(String imagePath){
    _imagePath = imagePath;
  }

  Future<int?> createTask(
    {required String title,
      required String detail,
      required createDate,
      required DateTime startDate,
      required DateTime estimateDate,
      String imagePath = '/asset/images/default.png'})
  async {
        setTitle(title);
        setDetail(detail);
        setStartDate(startDate);
        setEstimateDate(estimateDate);
        setImagePath(imagePath);

        var insertedTask = Task();

        var task = await taskService.insertTask(insertedTask);
        return task ; //consider create a default null task ?? Task.nullTask()
  }

  Future<bool> updateTaskStatus(int taskId) async {
     var task = await taskService.findTaskById(taskId);
     if (task != null){
       setDone();
       task.isDone = _isDone;
       return true;
     }
     return false;
  }

}