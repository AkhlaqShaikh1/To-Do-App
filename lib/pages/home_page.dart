import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/pages/add_task_page.dart';
import 'package:to_do_app/providers/task_provider.dart';
import 'package:velocity_x/velocity_x.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);
  static String id = "/home_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TO-DOs"),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: taskProvider.tasks.length,
                itemBuilder: (context, index) => Dismissible(
                  key: ValueKey(taskProvider.tasks[index].title),
                  onDismissed: (direction) {
                    Provider.of<TaskProvider>(context, listen: false)
                        .removeTask(index);
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(taskProvider.tasks[index].title),
                      subtitle: taskProvider.tasks[index].isCompleted
                          ? "Completed".text.make()
                          : "Incomplete".text.make(),
                    ),
                  ),
                ),
              ),
            ),
            CupertinoButton(
              child: "Add Task".text.size(25).white.bold.make(),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddTask(),
                  ),
                );
              },
              color: Colors.teal,
            ).py(8),
          ],
        ),
      ),
    );
  }
}
