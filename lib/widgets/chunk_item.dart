import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_manager/models/chunk.dart';

class _ChunkItemState extends State<ChunkItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const BoxDecoration(
        color: Color(0xFFE0E0E0),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        children: <Widget>[
          Text(
            widget.chunk.title,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            widget.chunk.finishedAt.toString(),
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class ChunkItem extends StatefulWidget {
  const ChunkItem({super.key, required this.chunk});

  final Chunk chunk;

  @override
  _ChunkItemState createState() => _ChunkItemState();
}
