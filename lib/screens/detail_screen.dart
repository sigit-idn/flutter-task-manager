import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_task_manager/models/task.dart';
import 'package:flutter_task_manager/models/chunk.dart';
import 'package:flutter_task_manager/widgets/chunk_list.dart';
import 'package:flutter_task_manager/widgets/task_stat.dart';

class _DetailScreenState extends State<DetailScreen> {
  Future<Task>? _task;
  Future<List<Chunk>>? _chunks;

  @override
  void initState() {
    super.initState();

    _task = Task.fetch(widget.id);
    _chunks = Chunk.fetchAll();

    _task!.then((task) {
      _chunks!.then((chunks) {
        task.chunks = chunks;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Detail'),
      ),
      child: Container(
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
            Expanded(
              child: FutureBuilder<Task>(
                future: _task,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return TaskStat(task: snapshot.data!);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  return const CupertinoActivityIndicator();
                },
              ),
            ),

            Expanded(
              child: FutureBuilder<List<Chunk>>(
                future: _chunks,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ChunkList(chunks: snapshot.data!);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  return const CupertinoActivityIndicator();
                },
              ),
            ),
          ]
        ),
      ),
    );
  }
}

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.id});

  final int id;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}