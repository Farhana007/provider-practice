import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:to_do_provider/model/to_do_model.dart';
import 'package:to_do_provider/providers/to_do_provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class ToDoHome extends StatefulWidget {
  const ToDoHome({super.key});

  @override
  State<ToDoHome> createState() => _ToDoHomeState();
}

class _ToDoHomeState extends State<ToDoHome> {
  //TEXT EDITING CONTROLLER
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //CREATING AN INSTANCE OF PROVIDER TO GET ACCESS OF OUR PROVIDER
    final provider = Provider.of<ToDoProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              "To Do List"
                  .text
                  .white
                  .size(18)
                  .makeCentered()
                  .box
                  .height(
                    100,
                  )
                  .width(MediaQuery.sizeOf(context).width * 1)
                  .bottomRounded(
                    value: 10,
                  )
                  .color(Color.fromARGB(255, 15, 3, 68))
                  .make(),
              40.heightBox,
              Expanded(
                child: Center(
                  child: ListView.builder(
                      itemCount: provider.todolist.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            provider.toDoCheck(provider.todolist[index]);
                            provider.colorChange(provider.todolist[index]);
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Icon(
                                Icons.check,
                                color: provider.tickC,
                                size: 30,
                              ),
                            ),
                            title: AnimatedDefaultTextStyle(
                              curve: Curves.easeInCubic,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                              duration: Duration(seconds: 10),
                              child: Text(
                                provider.todolist[index].title,
                              ),
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  provider
                                      .deleteToDoList(provider.todolist[index]);
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 15, 3, 68),
        onPressed: () {
          VxDialog.showAlert(context,
              title: "Add Task",
              content: TextField(
                controller: _textController,
                decoration: InputDecoration(hintText: "enter your to do"),
              ),
              showClose: true, onPressed: () {
            provider.addToDoList(new ToDoModel(
                title: _textController.text.toString(), isCompleted: true));
            _textController.clear();
          });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
