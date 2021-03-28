import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/tasks_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) { // Provider.of<TaskData>(context)를 taskData로 대체 !!
        return ListView.builder( // (Dynamic ListView Builder) : List를 단 한번만 빌드! (리소스 절약가능)
          itemBuilder: (context, index) {
            final taskItem = taskData.tasks[index];
            return TaskTile(
              taskTitle: taskItem.name,
              isChecked: taskItem.isDone,
              checkboxCallback: (bool aa) {
                taskData.updateTask(taskItem);
              },
              longPressCallback: () {
                taskData.deleteTask(taskItem);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },

    );
  }
}
