import 'package:flutter/cupertino.dart';
import 'package:flutter_task_manager/models/task.dart';
import 'package:flutter_task_manager/screens/detail_screen.dart';

class _TaskItemState extends State<TaskItem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => DetailScreen(id: widget.task.id!),
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
            Text(
              widget.task.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFA2D2FF),
              ),
            ),
            const SizedBox(height: 8),
            if (widget.task.description != null)
              Text(
                widget.task.description!,
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
                color: const Color(0xFFF0F0F0),
              ),
              child: FractionallySizedBox(
                widthFactor: widget.task.progress / 100,
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
                  '${widget.task.progress.toStringAsFixed(2)}%',
                  style: widget.task.deadline
                    .difference(DateTime.now()).inDays < 3
                    ? const TextStyle(
                        fontSize: 16,
                        color: Color(0xFFFFAFCC),
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
                    color: widget.task.deadline
                      .difference(DateTime.now()).inDays < 3
                      ? const Color(0xFFFFAFCC)
                      : const Color(0xFFBFE0FF),
                    border: widget.task.deadline
                      .difference(DateTime.now()).inDays < 3
                      ? Border.all(
                          color: const Color(0xFFFFAFCC),
                          width: 0.3,
                        )
                      : Border.all(
                          color: const Color(0xFF0084FF),
                          width: 0.3,
                        ),
                  ),
                  child: Text(
                    '${widget.task.deadline.difference(DateTime.now()).inDays} days left',
                    style: widget.task.deadline
                      .difference(DateTime.now()).inDays < 3
                      ? const TextStyle(
                          fontSize: 16,
                          color: Color(0xFFFF146A),
                        )
                      : const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF0084FF),
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

class TaskItem extends StatefulWidget {
  final Task task;

  const TaskItem({super.key, required this.task});

  @override
  _TaskItemState createState() => _TaskItemState();
}
