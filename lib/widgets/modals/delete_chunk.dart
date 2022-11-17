import 'package:flutter/cupertino.dart';

import '../../models/chunk.dart';

class DeleteChunkModal extends StatelessWidget {
  final Chunk chunk;

  const DeleteChunkModal({Key? key, required this.chunk}) : super(key: key);

  void deleteChunk(context) {
    Chunk.delete(chunk.id!);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Delete Chunk'),
      content: const Text('Are you sure you want to delete this chunk?'),
      actions: <Widget>[
        CupertinoDialogAction(
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        CupertinoDialogAction(
          child: const Text('Delete'),
          onPressed: () => deleteChunk(context),
        ),
      ],
    );
  }
}