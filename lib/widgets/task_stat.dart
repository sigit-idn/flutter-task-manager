import 'package:flutter/cupertino.dart';
import 'package:flutter_task_manager/models/task.dart';

class _TaskStatState extends State<TaskStat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFCDB4DB),
            Color(0xFFBDE0FE),
            Color(0xFFFFC8DD),
          ],
        ),
      ),
      child: Column(
        children: <Widget>[
          Text(
            widget.task.title,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.task.description!,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            widget.task.chunks.length.toString(),
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class TaskStat extends StatefulWidget {
  const TaskStat({super.key, required this.task});

  final Task task;

  @override
  _TaskStatState createState() => _TaskStatState();
}