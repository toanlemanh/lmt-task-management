import 'package:flutter_project/features/tasks/model/priority_enum.dart';
import 'package:flutter_project/features/tasks/model/task_category.dart';
import 'package:flutter_project/features/tasks/model/task_difficulty.dart';

class Task{
  final int taskId;
  String categoryEnum = TaskCategory.work.label;
  int priorityEnum = TaskPriority.veryLow.value;
  int difficultyEnum = TaskDifficulty.veryEasy.value;
  String title = '';
  String detail = '';
  bool isDone = false; // completed or not
  DateTime estimateDate;
  DateTime startDate;
  DateTime? completeDate;
  String? imagePath;

  bool isActive = false; // dated or outdated
  final DateTime createDate;
  DateTime? updatedDate;

  Task(this.taskId, this.title, this.detail,
      this.createDate, this.startDate, this.estimateDate);
}