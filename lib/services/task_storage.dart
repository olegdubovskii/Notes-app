import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class TaskStorage {

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/tasks.json');
  }

  Future<List<Map<String, dynamic>>> readTasks() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      var tasks = (jsonDecode(contents) as List<dynamic>).map((element) => {
            "taskName": element["taskName"],
            "taskDesc": element["taskDesc"]
          });
      var result = tasks.toList();
      return result;
    } catch (e) {
      return [];
    }
  }

  Future<File> writeTasks(List<Map<String, dynamic>> tasks) async {
    final file = await _localFile;
    String json = jsonEncode(tasks);
    return file.writeAsString('$json');
  }
}