import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/providers/task_provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/task_model.dart';

class AddTask extends StatelessWidget {
  AddTask({Key? key}) : super(key: key);
  static String id = "/task_input_page";

  _press(BuildContext context) {
    Task newTask = Task(
      isCompleted: false,
      title: _titleController.text,
    );
    Provider.of<TaskProvider>(context, listen: false).addTask(newTask);

    Navigator.of(context).pop();
    
  }

  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Add To-Do".text.make(),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          "Add Task".text.semiBold.size(25).makeCentered(),
          24.heightBox,
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
              border: OutlineInputBorder(),
            ),
          ),
          24.heightBox,
          CupertinoButton(
            child: "Add a Task".text.make(),
            onPressed: () {
              // print(_titleController.text);
              _press(context);
            },
            color: Theme.of(context).primaryColor,
          ),
        ],
      ).p(24),
    );
  }
}
