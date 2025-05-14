import 'package:flutter/cupertino.dart';
import 'package:flutter_project/features/tasks/service/itask_service.dart';
import 'package:mobx/mobx.dart';

import '../model/task.dart';
part 'task_list_store.g.dart';

class TaskListStore = _TaskListStoreBase with _$TaskListStore;

abstract class _TaskListStoreBase with Store{
  @observable
  late List<Task> _tasks = [];

  @observable
  bool isLoading = true;

  @computed
  get taskCount => _tasks.length;

  @computed
  get tasks => _tasks;

  late final ITaskService taskService;

  _TaskListStoreBase({required this.taskService}){
    fetchTasks();
  }

  @action
  Future<void> fetchTasks() async {
    debugPrint('fetching album list');
    _tasks = await taskService.loadTasksFromDb();
    debugPrint('fetched $_tasks');
    changeLoading();
  }

  @action
  void changeLoading(){
    isLoading = !isLoading;
  }

  // use TaskStore (one item) call insert task
  // then user clicks to home page and load task list again to update new created task
  // @action
  // Future<void> addTask() async {
  //   // call create task
  //
  //   //validate task
  //
  // }
  @action
  Future<bool> removeTask(int taskId) async {
    var isTaskRemoved = await taskService.removeTaskById(taskId);
    if (isTaskRemoved) {
      fetchTasks();
      return true;
    }
    return false;
  }


}