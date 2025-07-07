import 'package:flutter_project/features/tasks/model/priority_enum.dart';
import 'package:flutter_project/features/tasks/model/task_category.dart';
import 'package:flutter_project/features/tasks/model/task_difficulty.dart';
import 'package:json_annotation/json_annotation.dart';

final String columnId = '_id';
final String columnDetail = 'detail';
final String columnTitle = 'title';
final String columnCategoryEnum = 'category_enum';
final String columnPriorityEnum = 'priority_enum';
final String columnDifficultyEnum = 'difficulty_enum';
final String columnIsDone = 'is_done';
final String columnEstimateDate = 'estimate_date';
final String columnStartDate = 'start_date';
final String columnCompleteDate = 'complete_date';
final String columnImagePath = 'image_path';
final String columnIsActive = 'is_active';
final String columnCreateDate = 'create_date';
final String columnUpdatedDate = 'updated_date';

class Task{
  late int taskId;
  String categoryEnum = TaskCategory.work.label;
  int priorityEnum = TaskPriority.veryLow.value;
  int difficultyEnum = TaskDifficulty.veryEasy.value;
  String title = '';
  String detail = '';
  bool isDone = false; // completed or not
  late DateTime estimateDate;
  late DateTime startDate;
  DateTime? completeDate;
  String? imagePath = '/asset/images/default.png';

  bool isActive = true; // dated or outdated
  late DateTime createDate;
  DateTime? updatedDate;

  Task();
  //constrcutor for seeding
  Task.seed(this.taskId, this.title, this.detail,
      this.createDate, this.startDate, this.estimateDate);

  Task.fromJson(Map<String, dynamic> json) {
    taskId = json[columnId];
    title = json[columnTitle];
    detail = json[columnDetail];
    isDone = json[columnIsDone] == 0;
    categoryEnum = json[columnCategoryEnum];
    priorityEnum = json[columnPriorityEnum];
    difficultyEnum = json[columnDifficultyEnum];
    estimateDate = DateTime.parse(json[columnEstimateDate]);
    startDate = DateTime.parse(json[columnStartDate]);
    completeDate = json[columnCompleteDate] != null
        ? DateTime.parse(json[columnCompleteDate])
        : null;
    imagePath = json[columnImagePath];
    isActive = json[columnIsActive] == 1;
    createDate = DateTime.parse(json[columnCreateDate]);
    updatedDate = json[columnUpdatedDate] != null
        ? DateTime.parse(json[columnUpdatedDate])
        : null;
  }

  Map<String, dynamic> toJson() {
    return {
      columnId: taskId,
      columnCategoryEnum: categoryEnum,
      columnPriorityEnum: priorityEnum,
      columnDifficultyEnum: difficultyEnum,
      columnTitle: title,
      columnDetail: detail,
      columnIsDone: isDone ? 1 : 0,
      columnEstimateDate: estimateDate.toIso8601String(),
      columnStartDate: startDate.toIso8601String(),
      columnCompleteDate: completeDate?.toIso8601String(),
      columnImagePath: imagePath,
      columnIsActive: isActive ? 1 : 0,
      columnCreateDate: createDate.toIso8601String(),
      columnUpdatedDate: updatedDate?.toIso8601String(),
    };
  }


}