import 'package:flutter/cupertino.dart';
import 'package:flutter_task_manager/models/chunk.dart';
import 'package:flutter_task_manager/widgets/list-items/chunk_item.dart';

class ChunkList extends StatelessWidget {
  final List<Chunk> chunks;

  const ChunkList({Key? key, required this.chunks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        shrinkWrap: true,
        itemCount: chunks.length,
        itemBuilder: (context, index) {
          return ChunkItem(chunk: chunks[index]);
        },
      ),
    );
  }
}