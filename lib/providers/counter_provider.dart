import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//change notifier creating for changing counting
class CounterProvider extends ChangeNotifier {
  var _count = 0;

  List<Color> _colorList = [
    Colors.red,
    Colors.pink,
    Color.fromARGB(255, 34, 39, 164)
  ];

  List<Color> get colorList => _colorList;

  Color _bgColor = Colors.black;

  Color get bgColor => _bgColor;

  int get count => _count;

  void changeColor() {
    if (_count == 1) {
      _bgColor = _colorList[0];
    } else if (_count == 2) {
      _bgColor = _colorList[1];
    } else {
      _bgColor = _colorList[2];
    }
    notifyListeners();
  }

  void increamentCount() {
    _count++;
    changeColor();
    notifyListeners();
  }

  void decrementCount() {
    _count--;
    changeColor();
    notifyListeners();
  }
}
