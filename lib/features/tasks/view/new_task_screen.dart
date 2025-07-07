import 'package:flutter/material.dart';
import 'package:flutter_project/core/routing/app_routes.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/task_form.dart';
import '../model/task.dart';
import '../service/task_service.dart';
import '../viewmodel/task_list_store.dart';
import '../viewmodel/task_store.dart';
// final task =
//   Task.seed(1, 'eat breakfast', 'eat detail', DateTime.timestamp(), DateTime(2025,DateTime.december,1), DateTime(2025,DateTime.december,12) );

class NewTaskScreen extends StatelessWidget{

  final taskViewModel = TaskStore(taskService: TaskService());

  NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          onPressed: () => context.go(AppRoutes.home.path),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
      ),
      body:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: TaskForm(
                // key: ValueKey(task.taskId.toString()),
                // model: task,
                // viewmodel: taskViewModel,
              ),
          ),
          );
        }
  }

