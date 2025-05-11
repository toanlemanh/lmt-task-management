import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../features/tasks/model/task.dart';



class TaskItem extends StatelessWidget {
  final Task model;
  final TaskStore viewmodel;

  const TaskItem({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        elevation: 2,
        child: ListTile(
          onTap: onTap,
          leading: IconButton(
            icon: Icon(
              model.isDone ? Icons.check_circle : Icons.radio_button_unchecked,
              color: model.isDone ? Colors.green : Colors.grey,
            ),
            onPressed: onToggleDone,
          ),
          title: Text(
            model.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: model.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(
            '${model.categoryEnum} | ${model.priorityEnum} | ${model.difficultyEnum}',
            style: TextStyle(fontSize: 13, color: Colors.grey[600]),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: onDelete,
          ),
        ),
      ),
    );
  }
}