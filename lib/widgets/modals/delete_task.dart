import 'package:flutter/cupertino.dart';

import '../../models/task.dart';

class DeleteTaskModal extends StatelessWidget {
  final Task task;

  const DeleteTaskModal({Key? key, required this.task}) : super(key: key);

  void deleteTask(context) {
    Task.delete(task.id!);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Delete Task'),
      content: const Text('Are you sure you want to delete this task?'),
      actions: <Widget>[
        CupertinoDialogAction(
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        CupertinoDialogAction(
          child: const Text('Delete'),
          onPressed: () => deleteTask(context),
        ),
      ],
    );
  }
}