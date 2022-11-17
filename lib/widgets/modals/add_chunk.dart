import 'package:flutter/cupertino.dart';

import '../../models/chunk.dart';
import '../forms/chunk_form.dart';

class _AddChunkModalState extends State<AddChunkModal> {
  String _title = '';

  void createChunk() {
    Chunk.create({
      'title': _title,
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return ChunkForm(
      title: _title,
      setTitle: (String value) => setState(() => _title = value),
      submit: createChunk,
    );
  }
}

class AddChunkModal extends StatefulWidget {
  const AddChunkModal({super.key});

  @override
  _AddChunkModalState createState() => _AddChunkModalState();
}
