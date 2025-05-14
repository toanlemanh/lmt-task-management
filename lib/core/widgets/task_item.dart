import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../features/tasks/model/task.dart';
import '../../features/tasks/viewmodel/task_list_store.dart';
import '../../features/tasks/viewmodel/task_store.dart';

/**
 * @TODO
 * 1. write onTap to show a detail tasks
 *  using go_router (context.go()) with id + contain Edit button
 *
 *  2. disallow unactive to edit without edit button
 *  3. toggleDone => need viewmodel
 */

class TaskItem extends StatelessWidget {
  final Task model;
  final TaskStore viewmodel;

  void onToggleDone(){
    // viewmodel.
    print("Toggle done");
  }

  const TaskItem({super.key, required this.model, required this.viewmodel});
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Card(
        color: model.isActive ? Colors.red : Colors.white70,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        elevation: 2,
        child: ListTile(
         // onTap: onTap, => view detail
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
            '${model.startDate} - ${model.estimateDate}',
            style: TextStyle(fontSize: 13, color: Colors.grey[600]),
          ),
          trailing:const Icon(Icons.arrow_right),
          enabled: model.isActive, //outdated
        ),
      ),
    );
  }
}