import 'dart:convert';
import 'dart:developer';

import 'package:flutter_task_manager/models/chunk.dart';
import 'package:http/http.dart' as http;

class Task {
  final int?        id;
  final String      title;
  final String?     description;
  final DateTime?   startedAt;
  final DateTime    deadline;
  late  List<Chunk> chunks;

  Task({
    this.id,
    required this.title,
    required this.description,
    this.startedAt,
    required this.deadline,
    this.chunks = const [],
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      startedAt: json['startedAt'] != null ? DateTime.parse(json['startedAt']) : null,
      deadline: DateTime.parse(json['deadline']),
      chunks: json['chunks'] != null ? (json['chunks'] as List).map((chunk) => Chunk.fromJson(chunk)).toList() : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'startedAt': startedAt?.toIso8601String(),
      'deadline': deadline.toIso8601String(),
      'chunks': chunks.map((chunk) => chunk.toJson()).toList(),
    };
  }

  static Future<Task> fetch(int id) async {
    final response = await http.get(Uri.parse('https://my-json-server.typicode.com/sigit-idn/task-json-server/tasks/$id'));

    if (response.statusCode == 200) {
      return Task.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load task');
    }
  }

  static Future<List<Task>> fetchAll() async {
    final response = await http.get(Uri.parse('https://my-json-server.typicode.com/sigit-idn/task-json-server/tasks'));

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List).map((task) => Task.fromJson(task)).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  double get progress {
    int totalChunks = chunks.length;

    if (totalChunks == 0) {
      return 0;
    }

    int finishedChunks = chunks.where((chunk) => chunk.finishedAt != null).length;
    return finishedChunks / totalChunks * 100;
  }

  DateTime get estimatedFinishTime {
    if (progress % 100 == 0) {
      return deadline;
    }

    int estimatedSecondsLeft = ((100 - progress) * (finishedAt!.difference(startedAt!).inSeconds / progress)).round();

    return finishedAt!.add(Duration(seconds: estimatedSecondsLeft));
  }

  Duration get averageDuration {
    int totalFinishedChunks = chunks.where((chunk) => chunk.finishedAt != null).length;
    if (totalFinishedChunks == 0) {
      return Duration.zero;
    }

    int? totalDuration = chunks
      .where((chunk) => chunk.duration != null)
      .map((chunk) => chunk.duration?.inSeconds)
      .reduce((value, element) => value! + element!);

    return Duration(seconds: totalDuration! ~/ totalFinishedChunks); // ~/ means divide and round down
  }

  DateTime? get finishedAt {
    return chunks.map((chunk) => chunk.finishedAt).reduce((value, element) => value!.isAfter(element!) ? value : element);
  }

}