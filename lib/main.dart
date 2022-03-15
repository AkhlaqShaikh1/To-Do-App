import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/pages/add_task_page.dart';
import 'package:to_do_app/pages/home_page.dart';
import 'package:to_do_app/providers/task_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // which type of class we are listening
      create: (context) => TaskProvider(),
      //not given child because childs dont update
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "HELLO",
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        routes: {
          "/": (context) => const MyHome(),
          MyHome.id: (context) => const MyHome(),
          AddTask.id: (context) => AddTask(),
        },
      ),
    );
  }
}
