import 'package:flutter/cupertino.dart';

import '../../models/task.dart';
import '../forms/task_form.dart';

class _EditTaskModalState extends State<EditTaskModal> {
  late String _title;
  late String? _description;
  late DateTime _deadline;

  @override
  void initState() {
    super.initState();

    _title = widget.task.title;
    _description = widget.task.description;
    _deadline = widget.task.deadline;
  }

  void updateTask() {
    Task.update(widget.task.id!, {
      'title': _title,
      'description': _description,
      'deadline': _deadline,
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return TaskForm(
      title: _title,
      description: _description,
      deadline: _deadline,
      setTitle: (String value) => setState(() => _title = value),
      setDescription: (String value) => setState(() => _description = value),
      setDeadline: (DateTime value) => setState(() => _deadline = value),
      submit: updateTask,
    );
  }
}

class EditTaskModal extends StatefulWidget {
  final Task task;

  const EditTaskModal({super.key, required this.task});

  @override
  _EditTaskModalState createState() => _EditTaskModalState();
}