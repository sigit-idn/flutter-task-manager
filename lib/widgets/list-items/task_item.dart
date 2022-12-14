import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_manager/models/task.dart';
import 'package:flutter_task_manager/screens/detail_screen.dart';
import 'package:flutter_task_manager/widgets/modals/edit_task.dart';

import '../modals/delete_task.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  const TaskItem({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => DetailScreen(task: task),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFF0F0F0),
            ],
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x08000000),
              blurRadius: 8,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  task.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFA2D2FF),
                  ),
                ),
                Row(
                  children: <Widget>[
                    CupertinoButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) => EditTaskModal(task: task),
                        );
                      },
                      child: const Icon(
                        CupertinoIcons.pencil,
                        color: Color(0xFF666666),
                      ),
                    ),
                    const Divider(
                      indent: 8,
                    ),
                    CupertinoButton(
                      padding: const EdgeInsets.all(0),
                      borderRadius: BorderRadius.circular(30),
                      onPressed: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) => DeleteTaskModal(task: task),
                        );
                      },
                      child: const Icon(
                        CupertinoIcons.trash,
                        color: Color(0xFF666666),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (task.description != null)
              Text(
                task.description!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFFB0B0B0),
                ),
              ),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.only(top: 6, bottom: 6),
              height: 8,
              alignment: Alignment.centerLeft,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                  Color(0xFFE8E8E8),
                  Color(0xFFF0F0F0),
                  ],
                ),
              ),
              child: FractionallySizedBox(
                widthFactor: task.progress / 100,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFCDB4DB),
                        Color(0xFFB699C7),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '${task.progress.toStringAsFixed(2)}%',
                  style: task.daysLeft < 3
                    ? const TextStyle(
                        fontSize: 16,
                        color: Color(0xFFFA97BB),
                      )
                    : const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF70BAFF),
                      ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: task.daysLeft < 3
                      ? const Color(0xFFFECBDE)
                      : const Color(0xFFCDE7FF),
                  ),
                  child: Text(
                    '${task.daysLeft} days left',
                    style: task.daysLeft < 3
                      ? const TextStyle(
                          fontSize: 16,
                          color: Color(0xFFFC4588),
                        )
                      : const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF0F7ADD),
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}