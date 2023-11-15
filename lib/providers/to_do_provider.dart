import 'package:flutter/material.dart';
import 'package:to_do_provider/model/to_do_model.dart';

class ToDoProvider extends ChangeNotifier {
  final List<ToDoModel> _todolist = [];

  Color _greenC = Colors.green;
  Color _redC = Colors.red;

  Color _tickC = Colors.white;

  Color get greenC => _greenC;
  Color get redC => _redC;
  Color get tickC => _tickC;

  List<ToDoModel> get todolist => _todolist;

  void addToDoList(ToDoModel toDoModel) {
    _todolist.add(toDoModel);
    notifyListeners();
  }

  void deleteToDoList(ToDoModel toDoModel) {
    final index = _todolist.indexOf(toDoModel);
    _todolist.removeAt(index);
    notifyListeners();
  }

  void toDoCheck(ToDoModel toDoModel) {
    final index = _todolist.indexOf(toDoModel);
    _todolist[index].checkBox();
    notifyListeners();
  }

  void colorChange(ToDoModel toDoModel) {
    final index = _todolist.indexOf(toDoModel);

    if (_todolist[index].isCompleted == true) {
      _tickC = _greenC;
    } else {
      _tickC = _redC;
    }
    notifyListeners();
  }
}
