// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskStore on _TaskStoreBase, Store {
  Computed<dynamic>? _$taskCountComputed;

  @override
  dynamic get taskCount =>
      (_$taskCountComputed ??= Computed<dynamic>(() => super.taskCount,
              name: '_TaskStoreBase.taskCount'))
          .value;
  Computed<dynamic>? _$tasksComputed;

  @override
  dynamic get tasks => (_$tasksComputed ??=
          Computed<dynamic>(() => super.tasks, name: '_TaskStoreBase.tasks'))
      .value;

  late final _$_tasksAtom =
      Atom(name: '_TaskStoreBase._tasks', context: context);

  @override
  List<Task> get _tasks {
    _$_tasksAtom.reportRead();
    return super._tasks;
  }

  bool __tasksIsInitialized = false;

  @override
  set _tasks(List<Task> value) {
    _$_tasksAtom.reportWrite(value, __tasksIsInitialized ? super._tasks : null,
        () {
      super._tasks = value;
      __tasksIsInitialized = true;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_TaskStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$fetchTasksAsyncAction =
      AsyncAction('_TaskStoreBase.fetchTasks', context: context);

  @override
  Future<void> fetchTasks() {
    return _$fetchTasksAsyncAction.run(() => super.fetchTasks());
  }

  late final _$addTaskAsyncAction =
      AsyncAction('_TaskStoreBase.addTask', context: context);

  @override
  Future<void> addTask() {
    return _$addTaskAsyncAction.run(() => super.addTask());
  }

  late final _$_TaskStoreBaseActionController =
      ActionController(name: '_TaskStoreBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_TaskStoreBaseActionController.startAction(
        name: '_TaskStoreBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
taskCount: ${taskCount},
tasks: ${tasks}
    ''';
  }
}
