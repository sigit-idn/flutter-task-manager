import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/task.dart';
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
            Positioned(
              bottom: 12,
              right: 12,
              child: CupertinoButton(
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => const AddTaskModal(),
                  );
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFCDB4DB),
                        Color(0xFFAE93BE),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xAAAE93BE),
                        blurRadius: 12,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
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