import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_manager/models/task.dart';

class TaskSummary extends StatelessWidget {
  final List<Task> tasks;

  const TaskSummary({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
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
                width: 60,
                height: 60,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Tasks Summary',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xAAFFFFFF),
                    ),
                  ),
                  Text(
                    'Total: ${tasks.length}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xAAFFFFFF),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Divider(
            color: Colors.white,
            thickness: 0.6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text(
                    'Completed',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xAAFFFFFF),
                    ),
                  ),
                  Text(
                    '${tasks.length}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xAAFFFFFF),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  const Text(
                    'In Progress',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xAAFFFFFF),
                    ),
                  ),
                  Text(
                    '${tasks.where((task) => task.startedAt != null).length}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xAAFFFFFF),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  const Text(
                    'Not Started',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xAAFFFFFF),
                    ),
                  ),
                  Text(
                    '${tasks.where((task) => task.startedAt == null).length}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
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
