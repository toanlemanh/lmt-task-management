import 'package:flutter/cupertino.dart';
import 'package:flutter_project/features/tasks/service/itask_service.dart';
import 'package:mobx/mobx.dart';

import '../model/task.dart';
part 'task_store.g.dart';

class TaskStore = _TaskStoreBase with _$TaskStore;

abstract class _TaskStoreBase with Store{
  @observable
  late List<Task> _tasks = [];

  @observable
  bool isLoading = true;

  @computed
  get taskCount => _tasks.length;

  @computed
  get tasks => _tasks;

  late final ITaskService taskService;

  _TaskStoreBase({required this.taskService}){
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

  @action
  Future<void> addTask() async {
    //validate task
  }

  bool sanitizeTask(String title, String detail, ){
    return false;
  }



}