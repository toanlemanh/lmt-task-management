import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_project/core/routing/app_routes.dart';
import 'package:flutter_project/core/widgets/task_item.dart';
import 'package:flutter_project/features/tasks/viewmodel/task_store.dart';
import 'package:go_router/go_router.dart';

import '../model/task.dart';
import '../service/task_service.dart';
// Task(this.taskId, this.title, this.detail,
//       this.createDate, this.startDate, this.estimateDate);
final taskList = [
  Task(1, 'eat breakfast', 'eat detail', DateTime.timestamp(), DateTime(2025,DateTime.december,1), DateTime(2025,DateTime.december,12) ),
  Task(2, 'eat lunch', 'eat detail', DateTime.timestamp(), DateTime(2025,DateTime.december,1), DateTime(2025,DateTime.december,12) ),
  Task(3, 'eat dinner', 'eat detail', DateTime.timestamp(), DateTime(2025,DateTime.december,1), DateTime(2025,DateTime.december,12) ),
  Task(4, 'eat night', 'eat detail', DateTime.timestamp(), DateTime(2025,DateTime.december,1), DateTime(2025,DateTime.december,12) ),
];
class HomeScreen extends StatelessWidget{

  void onPressed(){
    print("App bar");
  }

  void confirmRemove(context) {
    //call view model to remove

    print("yes remove");
  }

  void cancelRemove(){

    print("no remove");
  }

  final taskViewModel = TaskStore(taskService: TaskService());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        backgroundColor: Colors.deepPurple,
        // leading: IconButton(
        //   onPressed: onPressed,
        //   icon: const Icon(
        //     Icons.arrow_back,
        //     color: Colors.grey,
        //   ),
        // ),
        actions: [ //trailing buttons
          IconButton(
            onPressed: () => context.go(AppRoutes.add.path),
            icon: const Icon(Icons.add_task),
          ),
        ],
      ),
      body: taskList.isEmpty // length
          ? const Center(child: Text('No tasks yet'))
          : ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                final task = taskList[index];
                return Dismissible(
            key: ValueKey(task.taskId.toString()),
            direction: DismissDirection.endToStart,
            background: const SizedBox(),
            secondaryBackground: Container(
              color: Colors.redAccent,
              width: 50,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'Remove task',
                style: TextStyle(color: Colors.white),
              ),
            ),
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.endToStart){
                return await showDialog(
                  context: context,
                  builder: (context) =>
                    AlertDialog(
                      key: ValueKey<String>('Remove'),
                      title: const Text('Remove'),
                      content: const Text('Do you want to delete permanently?'),
                      actions: [
                        ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text(
                              'Yes',
                              selectionColor: Colors.blue,
                            )
                        ),
                        ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text(
                              'No',
                              selectionColor: Colors.blue,
                            )
                        ),
                      ],
                    )
                );
              }
              return null;
            },
            onDismissed: (_) {
              // Optional: call remove method in ViewModel
             print("Only if confirm remove");
             // I will change later
             taskList.removeAt(index);
            },
            child: TaskItem(
              key: ValueKey(task.taskId.toString()),
              model: task,
              viewmodel: taskViewModel,
            ),
          );
              },
           ),
    );
  }

}