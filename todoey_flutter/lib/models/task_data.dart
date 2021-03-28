import 'package:flutter/foundation.dart'; // material.dart 는 foundation.dart를 포함한 형태였다.
import 'package:todoey_flutter/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {

  List<Task> _tasks = [ // 밖에서는 접근 못하도록, private변수로 선언 --> addTask 메서드 로만 task추가가 가능해진다. (tasks.add() 로 해버리는 오류 줄여줌)
    Task(name: 'Buy milk'),
    Task(name: 'Buy egg'),
    Task(name: 'Buy brew'),
  ];

  // collection 라이브러리
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks); // 밖에서 가져올때 tasks를 가져올 수 만 있지, 수정할 수는 없도록 (ex. add)
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners(); // 이게 있어야, 추가버튼 눌렀을때 제대로 반영됨
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}