import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => TaskData(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
