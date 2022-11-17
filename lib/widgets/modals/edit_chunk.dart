import 'package:flutter/cupertino.dart';

import '../../models/chunk.dart';
import '../forms/chunk_form.dart';

class _EditChunkModalState extends State<EditChunkModal> {
  late String _title;

  @override
  void initState() {
    super.initState();

    _title = widget.chunk.title;
  }

  void updateChunk() {
    Chunk.update(widget.chunk.id!, {
      'title': _title,
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return ChunkForm(
      title: _title,
      setTitle: (String value) => setState(() => _title = value),
      submit: updateChunk,
    );
  }
}

class EditChunkModal extends StatefulWidget {
  final Chunk chunk;

  const EditChunkModal({super.key, required this.chunk});

  @override
  _EditChunkModalState createState() => _EditChunkModalState();
}