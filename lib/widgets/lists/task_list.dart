import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/task.dart';
import '../list-items/task_item.dart';

class _TaskListState extends State<TaskList> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Column(
            children: widget.tasks
                .map((task) => TaskItem(task: task))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class TaskList extends StatefulWidget {
  final List<Task> tasks;

  const TaskList({Key? key, required this.tasks}) : super(key: key);

  @override
  _TaskListState createState() => _TaskListState();
}