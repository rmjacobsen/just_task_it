import 'package:flutter/material.dart';

class TaskList {
  final String id;
  final String title;
  final int color;
  final Icon icon;

  TaskList({
    this.id,
    this.title,
    this.color,
    this.icon,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'color': color,
      // Store the icon as an int based on its codePoint from IconData.
      'icon': icon.icon.codePoint,
    };
  }
}
