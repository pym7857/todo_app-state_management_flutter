import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    String newTaskTitle;

    return Container(
      color: Color(0xff757575), // #757575 : 배경색
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // 양 옆으로 길게 늘어뜨리기
          children: <Widget>[
            Text(
              'Add Task', // 글자가 항상 요소 맨 위에 위치
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true, // 창 띄우면, 자동으로 키보드 popup
              textAlign: TextAlign.center,
              onChanged: (newText) { // 사용자 입력 값
                newTaskTitle = newText;
              },
            ),
            FlatButton(
                onPressed: () {
                  //Add our task to list
                  Provider.of<TaskData>(context).addTask(newTaskTitle);
                  Navigator.pop(context); // 추가 후에는, 원래 화면으로 돌아가라. (굳이 사용자가 화면을 누르지 않더라도)
                },
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.lightBlueAccent)
          ],
        ),
      ),
    );
  }
}
