import 'package:flutter/material.dart';
import '../../models/chunk.dart';

class _ChunkItemState extends State<ChunkItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 16,
      ),
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
            widget.chunk.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF666666),
            ),
          ),
          const SizedBox(height: 8),
          if (widget.chunk.finishedAt != null)
            Text(
              widget.chunk.finishedAt!.toString().substring(0, 16),
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFFB0B0B0),
              ),
            ),
          if (widget.chunk.finishedAt == null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFCDB4DB),
                    Color(0xFF9B86A8),
                  ],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xAA9B86A8),
                    blurRadius: 8,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: TextButton(
                onPressed: () async {
                  await widget.chunk.partialUpdate(
                    {'finished_at': DateTime.now()},
                  );

                  widget.chunk.finishedAt = DateTime.now();
                  setState(() {});
                },
                child: const Text(
                  'Finish',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
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
