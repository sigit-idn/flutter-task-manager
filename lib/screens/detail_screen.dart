import 'package:flutter/cupertino.dart';
import 'package:flutter_task_manager/widgets/modals/add_chunk.dart';
import '../models/task.dart';
import '../widgets/buttons/add_button.dart';
import '../widgets/lists/chunk_list.dart';
import '../widgets/panes/task_stat.dart';

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Detail'),
      ),
      child: Stack(
        children: <Widget>[
          Container(
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
            child: Column(children: <Widget>[
              TaskStat(task: widget.task),
              ChunkList(chunks: widget.task.chunks),
            ]),
          ),
          const Positioned(
            bottom: 12,
            right: 12,
            child: AddButton(
              target: AddChunkModal()
            ),
          ),
        ],
      ),
    );
  }
}

class DetailScreen extends StatefulWidget {
  final Task task;

  const DetailScreen({super.key, required this.task});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}
