import 'package:flutter/material.dart';
import 'package:just_task_it/apps/task_manager/widgets/rounded_button.dart';
import 'package:just_task_it/core/widgets/header.dart';

class TaskDetailScreen extends StatefulWidget {
  @override
  _TaskDetailScreenState createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  String _appBarTitle = "Task Title";
  TextEditingController _taskTitleController = TextEditingController();
  TextEditingController _taskDescController = TextEditingController();

  @override
  void initState() {
    _taskTitleController.addListener(() {
      setState(() {
        _appBarTitle = _taskTitleController.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _taskTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHeader(context, isAppTitle: false, titleText: _appBarTitle),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: _taskTitleController, 
            ),
            TextField(
              controller: _taskDescController,
            ),
            buildRoundedButton(context, "Create Task", () {})
          ],
        ),
      ),
    );
  }
}
