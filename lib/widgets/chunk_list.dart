import 'package:flutter/cupertino.dart';
import 'package:flutter_task_manager/models/chunk.dart';
import 'package:flutter_task_manager/widgets/chunk_item.dart';

class _ChunkListState extends State<ChunkList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: const BoxDecoration(
        color: Color(0xFFE0E0E0),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: <Widget>[
          const Text(
            'Chunks',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.chunks.length,
              itemBuilder: (context, index) {
                return ChunkItem(chunk: widget.chunks[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ChunkList extends StatefulWidget {
  const ChunkList({super.key, required this.chunks});

  final List<Chunk> chunks;

  @override
  _ChunkListState createState() => _ChunkListState();
}