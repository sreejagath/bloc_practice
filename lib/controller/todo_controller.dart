import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:machine_test/model/todo.dart';

class TodoController extends GetxController {
  var todo = [].obs;
  var box = GetStorage();
  var todoCopy = [].obs;

  // TodoController() {
  //   readTodos();
  // }
  @override
  void onInit() {
    readTodos();
   // readMethod();
    super.onInit();
  }

  readTodos() async {
    //todo==null?todo.clear():null;
    //todo.clear();
    var todos = await box.read('todo');
    print('todos: $todos');
    if (todos != null) {
      todo.add(todos);
    } else {
      todo.add([]);
    }
    update();
  }

  storeData(Todo data) async {
    //todo.add(data);
    todoCopy.add(data);
    print('todo: $todoCopy');
    storeMethod(todoCopy);
    await box.write('todo', data.toMap());
    readTodos();
  }

  storeMethod(datas) async {
    print(datas);
    // var localCopy = [];
    // // todoCopy.forEach((element) {
    // //   localCopy.add(element);
    // // });
    // for (var i = 0; i < todoCopy.length; i++) {
    //   localCopy.add(todoCopy[i].toMap());
    // }
    // await box.write('todos', localCopy);
    //await box.write('todos', datas);
    // print('Box Todos:  ${box.read('todos')}');
  }

  // readMethod() async {
  //   todoCopy.value = await box.read('todos');
  //   print('Box Todos:  ${box.read('todos')}');
  // }

  removeData(Todo data) async {
    todo.remove(data);
    //await box.write('todo', todo);
    update();
  }
}
