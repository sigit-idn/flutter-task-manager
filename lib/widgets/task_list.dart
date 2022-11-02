import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_manager/models/task.dart';
import 'package:flutter_task_manager/widgets/task_item.dart';

class _TaskListState extends State<TaskList> {
  Future<List<Task>>? _futureTask;

  @override
  void initState() {
    super.initState();
    _futureTask = Task.fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          FutureBuilder<List<Task>>(
            future: _futureTask,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: snapshot.data!
                      .map((task) => TaskItem(task: task))
                      .toList(),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  _TaskListState createState() => _TaskListState();
}