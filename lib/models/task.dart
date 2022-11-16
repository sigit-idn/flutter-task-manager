import 'dart:convert';

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
  }) {
    for (var chunk in chunks) {
      chunk.task = this;
    }
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id         : json['id'],
      title      : json['title'],
      description: json['description'],
      startedAt  : json['startedAt'] != null ? DateTime.parse(json['startedAt']) : null,
      deadline   : DateTime.parse(json['deadline']),
      chunks     : json['chunks'] != null ? (json['chunks'] as List).map((chunk) => Chunk.fromJson(chunk)).toList() : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id'         : id,
      'title'      : title,
      'description': description,
      'startedAt'  : startedAt?.toIso8601String(),
      'deadline'   : deadline.toIso8601String(),
      'chunks'     : chunks.map((chunk) => chunk.toJson()).toList(),
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

  static Future<Task> create(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('https://my-json-server.typicode.com/sigit-idn/task-json-server/tasks'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      return Task.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create task');
    }
  }

  static Future<Task> update(int id, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse('https://my-json-server.typicode.com/sigit-idn/task-json-server/tasks/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return Task.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update task');
    }
  }

  static Future<Task> delete(int id) async {
    final response = await http.delete(
      Uri.parse('https://my-json-server.typicode.com/sigit-idn/task-json-server/tasks/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return Task.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete task');
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
    if (progress == 0) {
      return deadline;
    }

    DateTime? maxChunkFinishedAt = chunks
      .where((chunk) => chunk.finishedAt != null)
      .map((chunk) => chunk.finishedAt)
      .reduce((value, element) => value!.isAfter(element!) ? value : element);

    if (progress == 100) {
      return maxChunkFinishedAt!;
    }

    int estimatedSecondsLeft = ((100 - progress) / 100 * (maxChunkFinishedAt?.difference(startedAt?? DateTime.now()).inSeconds ?? 0)).toInt();

    return DateTime.now().add(Duration(seconds: estimatedSecondsLeft));
  }

  Duration get averageDuration {
    List<Chunk>? finishedChunks = chunks.where((chunk) => chunk.finishedAt != null).toList();

    if (finishedChunks.isEmpty) {
      return Duration.zero;
    }


    int? totalDuration = finishedChunks
    .map((chunk) => chunk.finishedAt!.difference(startedAt!).inSeconds)
    .reduce((value, element) => value + element);

    return Duration(seconds: totalDuration ~/ finishedChunks.length); // ~/ means divide and round down
  }

  DateTime? get finishedAt {
    if (chunks.isEmpty) {
      return null;
    }

    if (chunks.any((chunk) => chunk.finishedAt == null)) {
      return null;
    }

    return chunks
      .map((chunk) => chunk.finishedAt)
      .reduce((value, element) => value!.isAfter(element!) ? value : element);
  }

  int get daysLeft {
    return deadline.difference(DateTime.now()).inDays;
  }

}