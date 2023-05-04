import 'package:flutter/material.dart';

import '../../../services/task_storage.dart';

class TasksListScreen extends StatefulWidget {
  const TasksListScreen({super.key, required this.storage});

  final TaskStorage storage;
  
  @override
  State<TasksListScreen> createState() => _TasksListScreenState();
}

class _TasksListScreenState extends State<TasksListScreen> {
  List<Map<String, dynamic>> _allTasks = [];
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.storage.readTasks().then((value) {
      setState(() {
        _allTasks = value;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); 
    return Scaffold(
      appBar: AppBar(
        title: TextField(
                controller: searchController,
                onChanged: (value) => {setState((){
                })},
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                obscureText: false,
                style: theme.textTheme.bodyMedium,
                decoration: const InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.white24),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.green,
                  ),
                )
              ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
                child: ListView.separated(
                  itemCount: _allTasks.length,
                  separatorBuilder: (context, i) => const Divider(),
                  itemBuilder: (context, i) {
                    if(searchController.text == '' || _allTasks[i]['taskName'].contains(searchController.text)) {
                      return ListTile(
                    title: Text(
                      _allTasks[i]['taskName'],
                      style: theme.textTheme.bodyMedium,
                    ),
                    subtitle: Text(
                      _allTasks[i]['taskDesc'],
                      style: theme.textTheme.labelSmall,
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                      ),
                      onPressed: () { 
                        setState((){
                          _allTasks.remove(_allTasks[i]);
                        });
                        widget.storage.writeTasks(_allTasks);
                      },
                    ),
                    onTap: () async{
                      dynamic result = await Navigator.of(context).pushNamed(
                        'taskEditPage',
                        arguments: {
                          'taskName': _allTasks[i]['taskName'],
                          'taskDesc': _allTasks[i]['taskDesc'],
                        },
                      );
                      if(result == null) {
                        return;
                      }
                      setState(() {
                        _allTasks[i]['taskName'] = result['taskName'];
                        _allTasks[i]['taskDesc'] = result['taskDesc'];
                      });
                      widget.storage.writeTasks(_allTasks);
                    },
                      );
                    } else {
                      return Column();
                    }
                  },
                ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 81, 76, 76),
        child: const Icon(
          Icons.add_comment,
          size: 30.0,
          color: Colors.green,
        ),
        onPressed: () async {
          dynamic result = await Navigator.of(context).pushNamed('taskAddPage');
          if(result == null) {
            return;
          }
          setState(() {
            _allTasks.add({
              'taskName': result['taskName'], 'taskDesc': result['taskDesc']
            });
          });
          widget.storage.writeTasks(_allTasks);
        },
      ),
    );
  }
}
