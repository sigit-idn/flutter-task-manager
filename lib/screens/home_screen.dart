import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/buttons/add_button.dart';
import '../widgets/modals/add_task.dart';
import '../widgets/lists/task_list.dart';
import '../widgets/panes/task_summary.dart';

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Task>>? _futureTask;

  @override
  void initState() {
    super.initState();

    _futureTask = Task.fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Home'),
      ),
      child: Container(
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
        child: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                FutureBuilder(
                  future: _futureTask,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return TaskSummary(tasks: snapshot.data!);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    return const CupertinoActivityIndicator();
                  },
                ),
                FutureBuilder(
                  future: _futureTask,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return TaskList(tasks: snapshot.data!);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    return const CupertinoActivityIndicator();
                  },
                ),
              ],
            ),
            const Positioned(
              bottom: 12,
              right: 12,
              child: AddButton(
                target: AddTaskModal()
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}