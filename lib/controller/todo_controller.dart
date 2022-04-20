import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:machine_test/model/todo.dart';

class TodoController extends GetxController {
  var todo = [].obs;
  var box = GetStorage();

  TodoController(){
    todo.value = box.read('todo') ?? [];
  }

  storeData(Todo data) async {
    //todo.add(data);
    await box.write('todo', data.toMap());
  }
}
