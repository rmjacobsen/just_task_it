import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:just_task_it/apps/task_manager/screens/task_detail_screen.dart';
import 'package:just_task_it/core/services/db_helper.dart';
import '../models/task.dart';
import '../models/task_list.dart';

import '../widgets/rounded_button.dart';
import '../../../core/widgets/header.dart';

List DUMMY_LISTS = [
  TaskList(
    id: "l1",
    title: "House Tasks",
    color: Colors.green.value,
    icon: Icon(Icons.home),
  ),
  TaskList(
    id: "l2",
    title: "Work",
    color: Colors.blue.value,
    icon: Icon(Icons.work),
  ),
  TaskList(
    id: "l3",
    title: "School Assignments",
    color: Colors.pink.value,
    icon: Icon(Icons.school),
  ),
];

List DUMMY_TASKS = [
  Task(
    id: "t1",
    title: "Clean the kitchen",
    isDone: false,
    date: DateTime.now(),
    listId: "l1",
  ),
  Task(
    id: "t2",
    title: "Look up apartments",
    isDone: false,
    date: DateTime.now(),
    listId: null,
  ),
  Task(
    id: "t3",
    title: "Do groceries",
    isDone: false,
    date: DateTime.now(),
    listId: "l1",
  ),
  Task(
    id: "t4",
    title: "Fill out the spreadsheets",
    isDone: false,
    date: DateTime.now(),
    listId: "l2",
  ),
  Task(
    id: "t5",
    title: "Biology homework",
    isDone: false,
    date: DateTime.now(),
    listId: "l3",
  ),
  Task(
    id: "t6",
    title: "Do the financial statements",
    isDone: false,
    date: DateTime.now(),
    listId: null,
  ),
  Task(
    id: "t7",
    title: "Do project for math exam",
    isDone: false,
    date: DateTime.now(),
    listId: null,
  ),
  Task(
    id: "t8",
    title: "Pick up the playstation at store",
    isDone: true,
    date: DateTime.now(),
    listId: null,
  ),
];

class OverviewScreen extends StatefulWidget {
  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHeader(context, isAppTitle: true),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                // Add Task & Add List buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildRoundedButton(
                      context,
                      "Add Task",() {
                      Navigator.of(context).push( 
                        MaterialPageRoute(
                          builder: (BuildContext context) => TaskDetailScreen(),
                        ),
                      );
                      }),
                    buildRoundedButton(context, "Add List", () {}),
                  ],
                ),
                // All Task Title and list of all tasks
                SizedBox(height: 20.0),
                Text(
                  "All Tasks",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.black54,
                    width: 1,
                  )),
                  height: 300,
                  child: ListView.builder(
                    itemCount: DUMMY_TASKS.length,
                    itemBuilder: (BuildContext context, int i) =>
                        CheckboxListTile(
                      title: Text(DUMMY_TASKS[i].title),
                      value: DUMMY_TASKS[i].isDone,
                      onChanged: (bool value) {
                        setState(() {
                          return DUMMY_TASKS[i].isDone = !DUMMY_TASKS[i].isDone;
                        });
                        print(
                            "Task: ${DUMMY_TASKS[i].title} Status: ${DUMMY_TASKS[i].isDone}");
                      },
                    ),
                    shrinkWrap: true,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: CarouselSlider.builder(
              height: 250,
              itemCount: DUMMY_LISTS.length,
              itemBuilder: (BuildContext context, int i) => Container(
                width: 200,
                child: Column(
                  children: [
                    Card(
                      color: Color(DUMMY_LISTS[i].color),
                      child: Text(
                        DUMMY_LISTS[i].title,
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Icon(IconData(59641, fontFamily: 'MaterialIcons')),
                  ],
                ),
              ),
              enableInfiniteScroll: false,
              viewportFraction: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
