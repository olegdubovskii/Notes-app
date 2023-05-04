import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/tasksList/tasks_list.dart';
import 'package:flutter_application_1/features/task/task.dart';
import 'package:flutter_application_1/services/task_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 36, 35, 35),
        primarySwatch: Colors.grey,
        dividerColor: Colors.white24,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 81, 76, 76),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
        )),
        inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  hintStyle: const TextStyle(color: Colors.white30),
                  fillColor: const Color.fromARGB(255, 99, 99, 99),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                ),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
          bodyMedium: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          labelSmall: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w400,
              fontSize: 12,
          ),
        ),
      ),
      initialRoute: 'mainPage',
      routes: {
        'mainPage': (context) => TasksListScreen(storage: TaskStorage()),
        'taskEditPage': (context) => const TaskEditScreen(),
        'taskAddPage': (context) => const TaskAddScreen(),
      },
    );
  }
}


