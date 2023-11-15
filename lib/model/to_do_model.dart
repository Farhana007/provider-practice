class ToDoModel {
  late String title;
  late bool isCompleted;

  ToDoModel({required this.title, required this.isCompleted});

  void checkBox() {
    isCompleted = !isCompleted;
  }
}
