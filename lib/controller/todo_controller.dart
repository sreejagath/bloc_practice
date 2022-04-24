import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:machine_test/model/todo.dart';

class TodoController extends GetxController {
  var todo = [].obs;
  var box = GetStorage();

  TodoController() {
    readTodos();
  }

  readTodos() async {
    todo.clear();
    var todos = await box.read('todo');
    if (todos != null) {
      todo.add(todos);
    }
    update();
  }

  storeData(Todo data) async {
    await box.write('todo', data.toMap());
    readTodos();
  }

  removeData(Todo data)async{
    todo.remove(data);
    //await box.write('todo', todo);
    update();
  }
}
