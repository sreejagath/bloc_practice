import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/controller/todo_controller.dart';
import 'package:machine_test/model/todo.dart';

class AddScreen extends StatelessWidget {
  AddScreen({Key? key}) : super(key: key);
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Duration duration = const Duration(minutes: 0);
    var todoController = Get.find<TodoController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: title,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: description,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (() async {
                var resultingDuration = await showDurationPicker(
                  context: context,
                  initialTime: const Duration(minutes: 30),
                );
                duration = resultingDuration!;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Chose duration: $resultingDuration')));
              }),
              child: Container(
                width: Get.width * 0.5,
                height: Get.height * 0.04,
                decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: const Text('Pick Duration',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var createdAt = DateTime.now();
          // ignore: unnecessary_null_comparison
          if (title.text.isNotEmpty &&
              description.text.isNotEmpty &&
              duration != null) {
            Todo item = Todo(
              title: title.text,
              completed: false,
              description: description.text,
              duration: duration.toString(),
              createdAt: createdAt.toIso8601String(),
            );
            // todoController.todoCopy.add(item);
            // print('todoController.todoCopy: ${todoController.todoCopy}');
            todoController.storeData(item);
            Get.back();
          } else {
            Get.snackbar(
              'Error',
              'Enter all datas',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.blueGrey,
              maxWidth: Get.width * 0.5,
              colorText: Colors.white,
              borderRadius: 10,
            );
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
