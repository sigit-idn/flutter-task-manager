import 'dart:convert';
import 'dart:developer';

import 'package:flutter_task_manager/models/task.dart';
import 'package:http/http.dart' as http;

class Chunk {
  final int?      id;
  final String    title;
  final DateTime? finishedAt;
  late  Task?     task;

  Chunk({
    this.id,
    required this.title,
    this.finishedAt,
    this.task,
  });

  factory Chunk.fromJson(Map<String, dynamic> json) {
    return Chunk(
      id: json['id'],
      title: json['title'],
      finishedAt: json['finishedAt'] != null ? DateTime.parse(json['finishedAt']) : null,
      task: json['task'] is Task ? json['task'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'finishedAt': finishedAt?.toIso8601String(),
      'task': task?.toJson(),
    };
  }

  static Future<Chunk> fetch(int id) async {
    final response = await http.get(Uri.parse('https://my-json-server.typicode.com/sigit-idn/task-json-server/chunks/$id'));

    if (response.statusCode == 200) {
      return Chunk.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load chunk');
    }
  }

  static Future<List<Chunk>> fetchAll() async {
    final response = await http.get(Uri.parse('https://my-json-server.typicode.com/sigit-idn/task-json-server/chunks'));

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List).map((chunk) => Chunk.fromJson(chunk)).toList();
    } else {
      throw Exception('Failed to load chunks');
    }
  }

  Duration? get duration {
    if (finishedAt == null) {
      return null;
    }

    Chunk chunkBefore = task!.chunks.firstWhere((chunk) => chunk.finishedAt == finishedAt!.subtract(const Duration(seconds: 1)));
    DateTime startedAt = chunkBefore.finishedAt ?? task!.startedAt!;

    int days = finishedAt!.difference(startedAt).inDays;

    if (days > 0) {
      return Duration(seconds: finishedAt!.difference(startedAt).inSeconds - 15 * 3600);
    }

    if (days > 1) {
      return Duration(seconds: finishedAt!.difference(startedAt).inSeconds - days * 15 * 3600);
    }

    return finishedAt!.difference(startedAt);
  }
}
