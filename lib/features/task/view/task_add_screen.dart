import 'package:flutter/material.dart';

class TaskAddScreen extends StatefulWidget {
  const TaskAddScreen({super.key});

  @override
  State<TaskAddScreen> createState() => _TaskAddScreenState();
}

class _TaskAddScreenState extends State<TaskAddScreen> {

  final titleController = TextEditingController();
  final descController = TextEditingController();

  void addNote() {
    Navigator.pop(context, {
      'taskName': titleController.text,
      'taskDesc': descController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add task',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(
                'Task name',
                style: Theme.of(context).textTheme.bodyLarge, 
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: TextField(
              controller: titleController,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: const InputDecoration(
                hintText: 'Name',
                hintStyle: TextStyle(color: Colors.white24),
              ),
            ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
              child: Text(
                'Task description',
                style: Theme.of(context).textTheme.bodyLarge, 
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: TextField(
                maxLines: 3,
              controller: descController,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: const InputDecoration(
                hintText: 'Description',
                hintStyle: TextStyle(color: Colors.white24),
              ),
            ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
              child: SizedBox(
                width: 345,
                height: 50,
                child: ElevatedButton(
                  child: Text(
                    'Add',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onPressed: () {
                    addNote();
                  },
                )
              ),
            ),
          ],
        ),
    );
  }
}