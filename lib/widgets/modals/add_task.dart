import 'package:flutter/cupertino.dart';
import 'package:flutter_task_manager/models/task.dart';

import '../forms/task_form.dart';

class _AddTaskModalState extends State<AddTaskModal> {
  String _title = '';
  String _description = '';
  DateTime _deadline = DateTime.now();

  void createTask() {
    Task.create({
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
      submit: createTask,
    );
  }
}

class AddTaskModal extends StatefulWidget {
  const AddTaskModal({super.key});

  @override
  _AddTaskModalState createState() => _AddTaskModalState();
  
  void onAddTask(String title, String description, DateTime deadline) {}
}
