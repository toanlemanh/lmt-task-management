import 'package:flutter/material.dart';

class TaskDetailScreen extends StatelessWidget{
  final String taskId;
  @override
  Widget build(BuildContext context) {
    return const Text('detail');
  }
  const TaskDetailScreen({super.key, required this.taskId});
  
}