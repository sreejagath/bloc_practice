import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/controller/todo_controller.dart';
import 'package:machine_test/screens/details.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var todoController = Get.put(TodoController());
    todoController.readTodos();
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: todoController.todo.isEmpty
                      ? 1
                      : todoController.todo.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return todoController.todo.isEmpty
                        ? SizedBox(
                            height: Get.height * 0.5,
                            child: const Center(
                              child: Text('No to-do items'),
                            ),
                          )
                        : ListTile(
                            onTap: (() {
                              Get.to(const TodoDetails(), arguments: {
                                'todo': todoController.todo[index],
                                'index': index
                              });
                            }),
                            title: Text(todoController.todo[index]['title']),
                            subtitle:
                                Text(todoController.todo[index]['description']),
                            trailing: Container(
                              width: Get.width * 0.3,
                              height: 50,
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Container(
                                    width: Get.width * 0.16,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: todoController.todo[index]
                                                    ['completed'] ==
                                                true
                                            ? Colors.green
                                            : Colors.red,
                                        borderRadius: BorderRadius.circular(5)),
                                    alignment: Alignment.center,
                                    child: Text(
                                      todoController.todo[index]['completed'] ==
                                              true
                                          ? 'Done'
                                          : 'Pending',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      // todoController.todo.removeAt(index);
                                      todoController.removeData(
                                          todoController.todo[index]);
                                      Get.snackbar('Deleted', 'Item Deleted');
                                    },
                                    icon: Icon(Icons.delete),
                                  )
                                ],
                              ),
                            ),
                          );
                  }))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/add');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
