import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/task.dart';

class TaskStat extends StatelessWidget {
  final Task task;

  const TaskStat({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 120,
        left: 10,
        right: 10,
        bottom: 20,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFCDB4DB),
            Color(0xFF9B86A8),
          ],
        ),
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF9B86A8),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.asset(
                'assets/icons/task_icon.png',
                width: 100,
                height: 100,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      task.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xAAFFFFFF),
                      ),
                    ),
                    Text(
                      '${task.description}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xAAFFFFFF),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Table(
            columnWidths: const <int, TableColumnWidth>{
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(1),
            },
            children: [
              TableRow(
                children: [
                  const Text(
                    'Deadline',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xAAFFFFFF),
                    ),
                  ),
                  Text(
                    task.deadline.toString().substring(0, 16),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xAAFFFFFF),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  const Text(
                    'Progress',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xAAFFFFFF),
                    ),
                  ),
                  Text(
                    '${task.progress.toStringAsFixed(2)}%',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xAAFFFFFF),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  const Text(
                    'Estimated Finish Time',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xAAFFFFFF),
                    ),
                  ),
                  Text(
                    task.estimatedFinishTime.toString().substring(0, 16),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xAAFFFFFF),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
