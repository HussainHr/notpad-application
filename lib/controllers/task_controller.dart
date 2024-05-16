import 'package:get/get.dart';

import '../database/database_helper.dart';
import '../models/task_model.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DbHelper.insert(task);
  }

  // get all the data from table
  void getTask() async {
    List<Map<String, dynamic>> tasks = await DbHelper.query();
    taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
  }

// delete the data from database
  void delete(Task task) async {
    await DbHelper.delete(task);
    getTask();
  }

  // update task for this method

  void taskCompleted(int id) async {
    await DbHelper.update(id);
    getTask();
  }
}
