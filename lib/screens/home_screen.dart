import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_manager/models/chunk.dart';
import 'package:flutter_task_manager/models/task.dart';
import 'package:flutter_task_manager/screens/detail_screen.dart';
import 'package:flutter_task_manager/widgets/add_task.dart';
import 'package:flutter_task_manager/widgets/task_list.dart';
import 'package:path/path.dart';

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Home'),
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFCDB4DB),
              Color(0xFFBDE0FE),
              Color(0xFFFFC8DD),
            ],
          ),
        ),
        child: Stack(
          children: <Widget>[
            const Expanded(
              child: TaskList(),
            ),
            Positioned(
              bottom: 12,
              right: 12,
              child: CupertinoButton(
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => const AddTaskModal(),
                  );
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFCDB4DB),
                        Color(0xFFAE93BE),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFAE93BE),
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}