import 'package:flutter/cupertino.dart';

class EditingTaskScreen extends StatelessWidget{
  final String taskId;
  @override
  Widget build(BuildContext context) {
    return const Text('edit');
  }

  const EditingTaskScreen({super.key, required this.taskId});


}